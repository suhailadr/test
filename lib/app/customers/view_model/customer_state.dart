part of 'customer_bloc.dart';

sealed class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object> get props => [];
}

final class CustomerInitial extends CustomerState {}

final class CustomerLoading extends CustomerState {}

final class CustomerError extends CustomerState {
  final String? error;
  const CustomerError({this.error});
}

final class CustomerLoaded extends CustomerState {
  final List<Customer>? customers;
  const CustomerLoaded({this.customers});
}

final class CustomerAddSuccess extends CustomerState {}

final class ProductAdded extends CustomerState {
  final List<int>? products;
  const ProductAdded({this.products});
}
