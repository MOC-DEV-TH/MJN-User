import 'package:MJN/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app_constants.dart';

class AppUtils {
  static void showErrorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      icon: Icon(Icons.error, color: Colors.black),
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  static void showSuccessSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      icon: Icon(Icons.done, color: Colors.black),
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  static void removeDataFromGetStorage() {
    final box = GetStorage();
    box.remove(USER_NAME);
    box.remove(TOKEN);
    box.remove(UNIT);
    box.remove(BUILDING);
    box.remove(DATA_TENANT_ID);
    box.remove(DATA_INVOICE_ID);
  }

  static void showLogoutDialog(
      String title, String message, BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (_) => Center(
                child: Container(
                  height: 270,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  //child: Material(
                  //child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/dialog_card_bg.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  //color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.login_outlined,
                        size: 60,
                      ),
                      Center(
                        child: Text(
                          title,

                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black,
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Center(
                        child: Text(message,textAlign: TextAlign.center,style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 14,color: Colors.black),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 100,
                              height: 40,
                              child: RaisedButton(
                                  color: Theme.of(context).primaryColorDark,
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  }),
                            ),
                          ),



                          SizedBox(width: 40,),


                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 100,
                              height: 40,
                              child: RaisedButton(
                                  color: Theme.of(context).primaryColorDark,
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  onPressed: () {
                                    AppUtils.removeDataFromGetStorage();
                                    Get.offNamed(Splash2.routeName);
                                    //Navigator.of(context).pushReplacementNamed(Splash2.routeName);
                                  }),
                            ),
                          ),


                        ],)

                    ],
                  ),
                ),
              ));
    });
  }

  static void showSessionExpireDialog(
      String title, String message, BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => Center(
                child: Container(
                  height: 270,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  //child: Material(
                  //child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/dialog_card_bg.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  //color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 60,
                      ),
                      Center(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Center(
                        child: Text(message,textAlign: TextAlign.center,),
                      ),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5555,
                          height: MediaQuery.of(context).size.height * 0.0625,
                          child: RaisedButton(
                              color: Theme.of(context).primaryColorDark,
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              onPressed: () {
                                AppUtils.removeDataFromGetStorage();
                                Navigator.of(context).pop();
                                // Navigator.of(context).pushReplacementNamed(
                                //     SplashScreen.routeName);
                              }),
                        ),
                      ),

                    ],
                  ),
                ),
              ));
    });
  }


  static void showRequireUpdateDialog(
      String title, String message, BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (_) => Center(
            child: Container(
              height: 270,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              //child: Material(
              //child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/dialog_card_bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              //color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.update_outlined,
                    size: 60,
                  ),
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Center(
                    child: Text(message,textAlign: TextAlign.center,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 100,
                          height: 40,
                          child: RaisedButton(
                              color: Theme.of(context).primaryColorDark,
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              onPressed: () {

                              }),
                        ),
                      ),

                      SizedBox(width: 40,),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 100,
                          height: 40,
                          child: RaisedButton(
                              color: Theme.of(context).primaryColorDark,
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                      ),

                    ],)

                ],
              ),
            ),
          ));
    });
  }

}
