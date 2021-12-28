import 'dart:async';
import 'dart:convert';
import 'package:MJN/LocalString/LocalString.dart';
import 'package:MJN/NewViews/LoginView1.dart';
import 'package:MJN/controllers/checkRequireUpdateController.dart';
import 'package:MJN/models/notificationModelVO.dart';
import 'package:MJN/presistence/database/MyAppDatabase.dart';
import 'package:MJN/presistence/database/MyDB.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/utils/eventbus_util.dart';
import 'package:MJN/views/ChangePasswordView.dart';
import 'package:MJN/views/CreateServiceTicketView.dart';
import 'package:MJN/views/NewLoginView.dart';
import 'package:MJN/views/SecondLoginView.dart';
import 'package:MJN/views/ServiceComplainView.dart';
import 'package:MJN/views/TabView.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

import 'controllers/sendFirebaseTokenController.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');

  NotificationModelVO notiModel = NotificationModelVO.fromJson(message.data);

  NotificationModelVO notificationModelVO =
      NotificationModelVO.fromJson(message.data);
  MyDatabase? database = await MyAppDatabase.instance.database;
  final notificationDao = database!.notiDao;

  if (notiModel != null) {
    EventBusUtils.getInstance().fire(notiModel);
    print(message.data);

    notificationDao
        .insertNotification(notificationModelVO)
        .then((value) => print('Success'));

    Get.toNamed(
      TabScreens.routeName,
      arguments: "Notification",
    );
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

void onReceivedFirebaseMsg(RemoteMessage message) async {
  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
    print('notification.body' +
        message.notification!.body.toString() +
        ', notification.body' +
        message.notification!.title.toString());
  }

  if (message.data != null) {
    print('Message also contained a data: ' + jsonEncode(message.data));
  }

  NotificationModelVO notiModel = NotificationModelVO.fromJson(message.data);
  MyDatabase? database = await MyAppDatabase.instance.database;
  final notificationDao = database!.notiDao;

  if (notiModel != null) {
    print(message.data);
    EventBusUtils.getInstance().fire(notiModel);
    notificationDao
        .insertNotification(notiModel)
        .then((value) => print('Success'));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();

  //DatabaseUtil().InitDatabase();

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
  final SendFirebaseTokenController sendFirebaseTokenController =
      Get.put(SendFirebaseTokenController());

  final dataStorage = GetStorage();

  @override
  void initState() {
    MyAppDatabase.builder()
        .then((value) => MyAppDatabase.notificationDao = value);
    FirebaseMessaging.instance.subscribeToTopic('mjn');

    getFirebaseToken();

    FirebaseMessaging.instance.getToken().then((token) {
      sendFirebaseTokenToServer(token!);
    });

    super.initState();
  }

  sendFirebaseTokenToServer(String token) {
    if (dataStorage.read(UID).toString() != null) {
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

    Future.delayed(Duration(seconds: 5), () {
      checkRequireUpdateController.checkRequireUpdate(context).then((value) {
        if(checkRequireUpdateController.networkResult != null){
          if(checkRequireUpdateController.networkResult!.isRequieredUpdate!){
            setState(() {
              isLoading.value = true;
            });

            AppUtils.showRequireUpdateDialog(
                'Update Require', 'A new update is available', context);
          }
          else {
            Get.off(TabScreens(0));
          }
        }

      });
    });


    // AppUtils.showRequireUpdateDialog(
    //     'Update Require', 'A new update is available', context)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    // return SplashScreen(
    //   backgroundColor: Color(0xff242527),
    //   image: Image(image: AssetImage('assets/images/splash_screen_logo.png')),
    //   loadingText: Text(
    //     "Loading....",
    //     style: TextStyle(
    //         color: Color(0xff659EC7),
    //         fontWeight: FontWeight.bold,
    //         fontSize: 18.0),
    //   ),
    //   photoSize: 140.0,
    //   loaderColor: Color(0xff659EC7),
    // );
    return Container(
      color: Color(0xff242527),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage('assets/images/splash_screen_logo.png')),
          Text(''),
          Text(''),
          Column(
            children: [
              Text(
                'Loading....',
                style: TextStyle(
                    color:  Color(0xff188FC5),
                    fontSize: 24,
                    decoration: TextDecoration.none),
              ),
              SizedBox(height: 25,),
              Visibility(
                visible:isLoading.value ? false : true,
                  child: CircularProgressIndicator(color:  Color(0xff188FC5),))
            ],
          )
        ],
      ),
    );
  }
}

// class SplashScreen extends StatefulWidget {
//   static const routeName = '/splash_screen';
//   const SplashScreen({Key key}) : super(key: key);
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   AnimationController _controller;
//   final loginDataStorage = GetStorage();
//
//   @override
//   void initState() {
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       onReceivedFirebaseMsg(message);
//       NotificationModelVO notificationModelVO =
//       NotificationModelVO.fromJson(message.data);
//       if (notificationModelVO != null) {
//         flutterLocalNotificationsPlugin.show(
//             notificationModelVO.hashCode,
//             notificationModelVO.title,
//             notificationModelVO.body,
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 channel.description,
//                 //      one that already exists in example app.
//                 icon: 'launch_background',
//               ),
//             ));
//       }
//     });
//
//
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(seconds: (5)),
//       vsync: this,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Lottie.asset(
//         'assets/splash_lottie_network.json',
//         controller: _controller,
//         height: MediaQuery.of(context).size.height * 1,
//         animate: true,
//         onLoaded: (composition) {
//           _controller
//             ..duration = composition.duration
//             ..forward().whenComplete(() => Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => loginDataStorage.read(TOKEN) != null
//                           ? TabScreens()
//                           : LoginView()),
//                 ));
//         },
//       ),
//     );
//   }
// }
getFirebaseToken() async {
  String? token = await FirebaseMessaging.instance.getToken();
  print(token);
  return token;
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TabScreens(0);
  }
}
