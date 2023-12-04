part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<Product>? products;
  const ProductLoaded({this.products});
}

final class ProductError extends ProductState {
  final String? error;
  final int? errorCode;
  const ProductError({this.error, this.errorCode});
}

final class ProductCount extends ProductState {
  final List products;
  const ProductCount({this.products = const []});
}
