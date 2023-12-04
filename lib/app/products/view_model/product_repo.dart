import 'package:technaureus/app/products/model/product.dart';
import 'package:technaureus/app/products/view_model/product_bloc.dart';
import 'package:technaureus/core/common/app_common_functions.dart';
import 'package:technaureus/core/generic_repo/user_repository.dart';
import 'package:technaureus/core/utils/app_urls.dart';
import 'package:technaureus/core/utils/local_storage.dart';

class ProductRepo {
  static Future<dynamic> getProducts() async {
    final response = await UserRepository.networkRequest(
        path: AppUrls.products, responseModel: ProductModel.fromJson);

    final internetAvailablity =
        await AppCommonFunctions.checkInternetAvailability();

    if (!internetAvailablity) {
      final productModel = await LocalStorages.getDataFrom<ProductModel>(
          db: AppUrls.products, key: AppUrls.products);

      final List<Product>? products = productModel.data;

      return ProductLoaded(products: products);
    }

    if (response is GenericError) {
      return ProductError(error: response.error, errorCode: response.errorCode);
    }
    if (response is ProductModel) {
      await LocalStorages.addDataTo<ProductModel>(
          db: AppUrls.products, key: AppUrls.products, value: response);

      return ProductLoaded(products: response.data);
    }
  }

  static Future<dynamic> addFirstProduct(
      {required int userId, required int productId}) async {
    await LocalStorages.addDataTo(
        db: 'orders', key: userId.toString(), value: [productId]);
  }

  static Future<dynamic> addProduct(
      {required int userId,
      required int productId,
      required List previousValue}) async {
    await LocalStorages.addDataTo(
        db: 'orders',
        key: userId.toString(),
        value: List.from([...previousValue, productId]));
  }

  static Future<dynamic> getProductCount({
    required int userId,
  }) async {
    var data =
        await LocalStorages.getDataFrom(db: 'orders', key: userId.toString());
    print(data);
  }
}
