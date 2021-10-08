import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/login_response.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/tabView.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginResponse loginResponse;
  var isLoading = false.obs;
  final loginDataStorage = GetStorage();

  void fetchLoginData(Map<String, String> map, BuildContext context) async {
    try {
      isLoading(true);

      var res = await MjnAPI.fetchLoginData(map);
      if (res != null) {
        loginResponse = res;

        if (loginResponse.status == 'Success') {
          loginDataStorage.write(USER_NAME, loginResponse.userName);
          loginDataStorage.write(UID, loginResponse.uid);
          loginDataStorage.write(BUILDING, loginResponse.details[0].building);
          loginDataStorage.write(UNIT, loginResponse.details[0].unit);
          loginDataStorage.write(
              DATA_TENANT_ID, loginResponse.details[0].tenantId);
          loginDataStorage.write(TOKEN, loginResponse.token);

          Navigator.of(context).pushReplacementNamed(TabScreens.routeName);
        }

        print(loginResponse.status);
      }
    } finally {
      isLoading(false);
    }
  }
}
