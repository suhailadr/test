part of 'customer_bloc.dart';

sealed class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

final class GetAllCustomers extends CustomerEvent {}

final class SearchCustomers extends CustomerEvent {
  final String query;
  const SearchCustomers({required this.query});
}

final class AddCustomer extends CustomerEvent {
  final Map<String, dynamic> customer;
  const AddCustomer({required this.customer});
}

final class AddProductToCart extends CustomerEvent {
  final List<int>? products;
  const AddProductToCart({required this.products});
}
