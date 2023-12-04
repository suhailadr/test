import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:technaureus/app/customers/model/customer.dart';
import 'package:technaureus/app/customers/view_model/customer_repo.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(CustomerInitial()) {
    on<GetAllCustomers>((event, emit) async {
      emit(CustomerLoading());
      emit(await CustomerRepo.getAllCustomers());
    });
    on<SearchCustomers>((event, emit) async {
      emit(CustomerLoading());
      emit(await CustomerRepo.searchCustomers(event.query));
    });
    on<AddCustomer>((event, emit) async {
      emit(CustomerLoading());
      await CustomerRepo.addCustomer(event.customer);
    });
    on<AddProductToCart>((event, emit) async {
      emit(ProductAdded(products: event.products));
    });
  }
}
