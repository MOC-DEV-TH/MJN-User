import 'package:MJN/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app_constants.dart';

class AppUtils{


static void showErrorSnackBar(String title,String message){
    Get.snackbar(
      title,
      message,
      icon: Icon(Icons.error, color: Colors.black),
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

static void showSuccessSnackBar(String title,String message){
  Get.snackbar(
    title,
    message,
    icon: Icon(Icons.done, color: Colors.black),
    backgroundColor: Colors.green,
    snackPosition: SnackPosition.BOTTOM,
  );
}

static void removeDataFromGetStorage(){
  final box = GetStorage();
  box.remove(USER_NAME);
  box.remove(TOKEN);
  box.remove(UNIT);
  box.remove(BUILDING);
  box.remove(DATA_TENANT_ID);
  box.remove(DATA_INVOICE_ID);
}

static void showLogoutDialog(String title,String message,BuildContext context){
  final dataStorage = GetStorage();
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Ok"),
    onPressed:  () {
      AppUtils.removeDataFromGetStorage();
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed(SplashScreen.routeName);

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    insetPadding: EdgeInsets.all(10),
    content: Text(message),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



}

