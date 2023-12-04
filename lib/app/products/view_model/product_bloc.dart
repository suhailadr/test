// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:technaureus/app/products/model/product.dart';
import 'package:technaureus/app/products/view_model/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProducts>((event, emit) async {
      emit(ProductLoading());
      emit(await ProductRepo.getProducts());
    });
    on<GetProductCount>((event, emit) async {
      await ProductRepo.getProductCount(userId: event.userId);
    });
    on<AddFirstProduct>((event, emit) async {
      await ProductRepo.addFirstProduct(
          userId: event.userId, productId: event.productId);
    });
    on<AddProduct>((event, emit) async {
      emit(ProductCount(products: event.products));
    });
  }
}
