import 'package:dio/dio.dart';
import 'package:technaureus/app/customers/model/customer.dart';
import 'package:technaureus/app/customers/model/customer_resp.dart';
import 'package:technaureus/app/customers/view_model/customer_bloc.dart';
import 'package:technaureus/core/common/app_common_functions.dart';
import 'package:technaureus/core/generic_repo/network_request.dart';
import 'package:technaureus/core/generic_repo/user_repository.dart';
import 'package:technaureus/core/utils/app_urls.dart';
import 'package:technaureus/core/utils/local_storage.dart';

class CustomerRepo {
  static Future<dynamic> getAllCustomers() async {
    final response = await UserRepository.networkRequest(
        path: AppUrls.customers, responseModel: CustomerModel.fromJson);
    final internetAvailablity =
        await AppCommonFunctions.checkInternetAvailability();

    if (!internetAvailablity) {
      final customerModel = await LocalStorages.getDataFrom<CustomerModel>(
          db: AppUrls.customers, key: AppUrls.customers);

      final List<Customer>? customers = customerModel.data;

      return CustomerLoaded(customers: customers);
    }
    if (response is GenericError) {
      return CustomerError(error: response.error);
    }
    if (response is CustomerModel) {
      await LocalStorages.addDataTo<CustomerModel>(
          db: AppUrls.customers, key: AppUrls.customers, value: response);

      return CustomerLoaded(customers: response.data);
    }
  }

  static Future<dynamic> searchCustomers(String query) async {
    final response = await UserRepository.networkRequest(
        path: AppUrls.serchCostomers + query,
        responseModel: CustomerModel.fromJson);
    if (response is GenericError) {
      return CustomerError(error: response.error);
    }
    if (response is CustomerModel) {
      return CustomerLoaded(customers: response.data);
    }
  }

  static Future<dynamic> addCustomer(Map<String, dynamic> customer) async {
    final response = await UserRepository.networkRequest(
        path: AppUrls.customers,
        responseModel: CustomerResponse.fromJson,
        jsonData: NetworkRequestBody.formData(FormData.fromMap(customer)),
        requestType: NetworkRequestType.POST);
    print(response);
    if (response is GenericError) {
      print(response.error);
    }
  }
}
