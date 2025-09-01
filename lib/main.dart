import 'dart:async';
import 'dart:convert';
import 'package:MJN/LocalString/LocalString.dart';
import 'package:MJN/NewViews/LoginView1.dart';
import 'package:MJN/controllers/checkRequireUpdateController.dart';
import 'package:MJN/models/notificationModelVO.dart';
import 'package:MJN/presistence/database/MyAppDatabase.dart';
import 'package:MJN/presistence/database/MyDB.dart' hide NotificationModelVO;
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/utils/eventbus_util.dart';
import 'package:MJN/views/ChangePasswordView.dart';
import 'package:MJN/views/CreateServiceTicketView.dart';
import 'package:MJN/views/NewLoginView.dart';
import 'package:MJN/views/SecondLoginView.dart';
import 'package:MJN/views/ServiceComplainView.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dataStorage = GetStorage();

  @override
  void initState() {
    MyAppDatabase.builder()
        .then((value) => MyAppDatabase.notificationDao = value);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: LocalString(),
        locale: Locale('en', 'US'),
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          TabScreens.routeName: (ctx) => TabScreens(0),
          ChangePasswordView.routeName: (ctx) => ChangePasswordView(),
          CreateServiceTicketView.routeName: (ctx) => CreateServiceTicketView(),
          SecondLoginVIew.routeName: (ctx) => SecondLoginVIew(),
          NewLoginView.routeName: (ctx) => NewLoginView(),
          LoginView1.routeName: (ctx) => LoginView1(),
          Splash2.routeName: (ctx) => Splash2(),
          ServiceComplainView.routeName: (ctx) => ServiceComplainView(),
        },
        home: Splash2());
  }
}

class Splash2 extends StatefulWidget {
  static const routeName = '/splash_screen';

  @override
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  final CheckRequireUpdateController checkRequireUpdateController =
      Get.put(CheckRequireUpdateController());

  var isLoading = false.obs;

  @override
  void initState() {
    checkRequireUpdateController.checkRequireUpdate(context);

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   onReceivedFirebaseMsg(message);
    //   NotificationModelVO notificationModelVO =
    //       NotificationModelVO.fromJson(message.data);
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode,
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //             android: AndroidNotificationDetails(
    //               channel.id,
    //               channel.name,
    //               channel.description,
    //               //      one that already exists in example app.
    //               icon: 'launch_background',
    //             ),
    //             iOS: IOSNotificationDetails(
    //                 presentAlert: true,
    //                 presentSound: true,
    //                 presentBadge: true)));
    //   }
    // });
    //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    Future.delayed(Duration(seconds: 7), () {
      checkRequireUpdate();
    });

    super.initState();
  }

  void checkRequireUpdate() {
    checkRequireUpdateController.checkRequireUpdate(context).then((value) {
      if (checkRequireUpdateController.networkResult != null) {
        if (checkRequireUpdateController.networkResult!.isRequieredUpdate!) {
          setState(() {
            isLoading.value = true;
          });

          AppUtils.showRequireUpdateDialog(
              'Update Require', 'A new update is available', context);
        } else {
          Get.off(TabScreens(0));
        }
      } else {
        setState(() {
          isLoading.value = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff242527),
      child: isLoading.value
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  size: 100,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Network Error!',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Connect to the internet and try again.',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Retry'),
                  onPressed: () {
                    setState(() {
                      isLoading.value = false;
                      Future.delayed(Duration.zero, () => checkRequireUpdate());
                    });
                  },
                )

              ],
            ))
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                    image: AssetImage('assets/images/splash_screen_logo.png')),
                Text(''),
                Text(''),
                Column(
                  children: [
                    Text(
                      'Loading....',
                      style: TextStyle(
                          color: Color(0xff188FC5),
                          fontSize: 24,
                          decoration: TextDecoration.none),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Visibility(
                        visible: isLoading.value ? false : true,
                        child: CircularProgressIndicator(
                          color: Color(0xff188FC5),
                        ))
                  ],
                )
              ],
            ),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TabScreens(0);
  }
}
