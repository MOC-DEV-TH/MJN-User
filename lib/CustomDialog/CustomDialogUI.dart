import 'package:MJN/NewViews/LoginView1.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get_storage/get_storage.dart';
class DialogUI extends StatefulWidget {


  const DialogUI({Key key}) : super(key: key);

  @override
  _DialogUIState createState() => _DialogUIState();
}

class _DialogUIState extends State<DialogUI> {
  String manualOne = '';
  String manualTwo = '';
  String manualThree = '';
  bool isVisible = false;
  final langStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      //margin: EdgeInsets.only(top: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 14,top: 12,bottom: 12),
              alignment: Alignment.center,
              width: 200,
              height: 320,
              color: Color(0xff242527),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>TabScreens(1)));

                              });

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text('About Us',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none)),
                            )),
                   GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>TabScreens(2)));

                          },
                          child: Text('Product and Services',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none)),
                        ),
                    GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>TabScreens(3)));

                          },
                          child: Text('Terms & Conditions',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none)),
                        ),
                     GestureDetector(
                            onTap: () {

                              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>TabScreens(4)));

                            },
                            child: Text('Contact Us',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none))),
                    GestureDetector(
                            onTap: () {

                              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>TabScreens(5)));

                            },
                            child: Text('My Account',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none))),
                     GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = true;
                                manualOne = 'Login Manual';
                                manualTwo = 'Service Ticket Manual';
                                manualThree = 'Online Payment Manual';
                              });

                            },
                            child: Text('User Manual',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                    fontSize: 14))),

                     Visibility(
                       visible: isVisible,
                       child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(manualOne,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none)),
                              )),
                     ),


                     Visibility(
                       visible: isVisible,
                       child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(manualTwo,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none)),
                              )),
                     ),


                    Visibility(
                      visible: isVisible,
                      child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(manualThree,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none)),
                              )),
                    ),


                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        langStorage.read(TOKEN) != null
                            ? AppUtils.showLogoutDialog(
                            'Logout',
                            'Are you sure you want to exit\nthis application?',
                            context)
                            : Navigator.of(context)
                            .pushReplacementNamed(LoginView1.routeName);
                      },
                      child: Text(langStorage.read(TOKEN) != null ? 'Logout' : 'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none)),
                    ),
                  ],
                ),
              )
        ],
      ),
    );
  }
}