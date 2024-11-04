
import 'package:dividex_new/customers/models/CustomerResponse.dart';
import 'package:dividex_new/customers/network/Network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomersController extends GetxController {

  String baseUrl = "http://192.168.1.10:3000/customers";

  var isLoading = false.obs;
  var customerResponse = CustomerResponse().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<CustomerResponse> getCustomers() async{
    try {
      isLoading(true); // Show progress indicator
      var response = await Network().getApi(baseUrl);
      if (response.statusCode == 200) {
        customerResponse.value = CustomerResponse.fromJson(response.data);
      } else {
       // Get.snackbar('Error', 'Failed to load data');
      }
      return customerResponse.value;
    } catch (e,stacktrace) {
      debugPrint('issue is : $e , $stacktrace');
      //Get.snackbar('Error', 'Failed to load data');
    } finally {
      isLoading(false); // Hide progress indicator
    }
    return customerResponse.value;
  }

}