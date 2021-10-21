import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/loginVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginVo loginVo;
  var isLoading = false.obs;
  final loginDataStorage = GetStorage();

  void fetchLoginData(Map<String, String> map, BuildContext context) async {
    try {
      isLoading(true);

      var res = await MjnAPI.fetchLoginData(map);
      if (res != null) {
        loginVo = res;

        if (loginVo.status == 'Success') {
          loginDataStorage.write(USER_NAME, loginVo.userName);
          loginDataStorage.write(UID, loginVo.uid);
          loginDataStorage.write(BUILDING, loginVo.details[0].building);
          loginDataStorage.write(UNIT, loginVo.details[0].unit);
          loginDataStorage.write(
              DATA_TENANT_ID, loginVo.details[0].tenantId);
          loginDataStorage.write(TOKEN, loginVo.token);

          Navigator.of(context).pushReplacementNamed(TabScreens.routeName);
        }

        print(loginVo.status);
        print(loginVo.description);
        print(loginVo.uid);
      }
    } finally {
      isLoading(false);
    }
  }
}
