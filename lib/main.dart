import 'dart:convert';

import 'package:MJN/LocalString/LocalString.dart';
import 'package:MJN/models/notificationModelVO.dart';
import 'package:MJN/presistence/db/database_util.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/ChangePasswordView.dart';
import 'package:MJN/views/CreateServiceTicketView.dart';
import 'package:MJN/views/LoginView.dart';
import 'package:MJN/views/NewLoginView.dart';
import 'package:MJN/views/SecondLoginView.dart';
import 'package:MJN/views/tabView.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import 'controllers/sendFirebaseTokenController.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');

  NotificationModelVO notiModel = NotificationModelVO.fromJson(message.data);

  NotificationModelVO notificationModelVO = NotificationModelVO.fromJson(message.data);

  if (notiModel != null) {
    DatabaseUtil().InitDatabase().then((value) {
      DatabaseUtil().insertNotification(notificationModelVO);
    });
  }
}

const AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();


void onReceivedFirebaseMsg(RemoteMessage message) {
  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
    print('notification.body' + message.notification.body + ', notification.body' + message.notification.title);
  }

  if (message.data != null) {
    print('Message also contained a data: ' + jsonEncode(message.data));
  }

  NotificationModelVO notiModel = NotificationModelVO.fromJson(message.data);

  if (notiModel != null) {

    DatabaseUtil().insertNotification(notiModel);
  }
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();

  DatabaseUtil().InitDatabase();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final SendFirebaseTokenController sendFirebaseTokenController = Get.put(SendFirebaseTokenController());
  final dataStorage = GetStorage();
  @override
  void initState() {
    FirebaseMessaging.instance.subscribeToTopic('mjn');

    getFirebaseToken();

    FirebaseMessaging.instance.getToken().then((token) {
      sendFirebaseTokenToServer(token);
    });

    super.initState();
  }

  sendFirebaseTokenToServer(String token){
    if(dataStorage.read(UID).toString() != null)  {
      Map<String, String> map = {
        'user_id': dataStorage.read(UID),
        'app_version': app_version,
        'firebase_token': token
      };

      sendFirebaseTokenController.sendFirebaseTokenToServer(map);

    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: Locale('en', 'US'),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
                button: TextStyle(color: Colors.white),
              )),
      debugShowCheckedModeBanner: false,
      routes: {
        TabScreens.routeName: (ctx) => TabScreens(),
        ChangePasswordView.routeName: (ctx) => ChangePasswordView(),
        CreateServiceTicketView.routeName: (ctx) => CreateServiceTicketView(),
        SecondLoginVIew.routeName: (ctx) => SecondLoginVIew(),
        NewLoginView.routeName: (ctx) => NewLoginView(),
      },
      home: SplashScreen()
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  final loginDataStorage = GetStorage();

  @override
  void initState() {



    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      onReceivedFirebaseMsg(message);
      NotificationModelVO notificationModelVO =
      NotificationModelVO.fromJson(message.data);
      if (notificationModelVO != null) {
        flutterLocalNotificationsPlugin.show(
            notificationModelVO.hashCode,
            notificationModelVO.title,
            notificationModelVO.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });


    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (5)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        'assets/splash_lottie_network.json',
        controller: _controller,
        height: MediaQuery.of(context).size.height * 1,
        animate: true,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(() => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => loginDataStorage.read(TOKEN) != null
                          ? TabScreens()
                          : LoginView()),
                ));
        },
      ),
    );
  }
}

 getFirebaseToken() async {
  String token = await FirebaseMessaging.instance.getToken();
  return token;

}


