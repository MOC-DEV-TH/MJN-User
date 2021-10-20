import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils{

static void showSnackBar(String title,String message){
    Get.snackbar(
      title,
      message,
      icon: Icon(Icons.error, color: Colors.black),
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}