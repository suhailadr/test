part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class GetProducts extends ProductEvent {}

final class AddFirstProduct extends ProductEvent {
  final int userId;
  final int productId;
  const AddFirstProduct({required this.userId, required this.productId});
}

final class AddProduct extends ProductEvent {
  final List products;
  const AddProduct({required this.products});
}

final class GetProductCount extends ProductEvent {
  final int userId;
  const GetProductCount({required this.userId});
}
