import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/login_response.dart';
import 'package:MJN/views/tabView.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController{
    LoginResponse loginResponse;
    var isLoading = false.obs;

    void fetchLoginData(Map<String, String> map,BuildContext context) async {
      try {
        isLoading(true);
        var res = await MjnAPI.fetchLoginData(map);
        if (res != null) {
          loginResponse = res;

            if(loginResponse.status == 'Success') {
              Navigator.of(context)
                  .pushReplacementNamed(TabScreens.routeName);
            }

          print(loginResponse.status);
        }
      } finally {
        isLoading(false);
      }
    }
}