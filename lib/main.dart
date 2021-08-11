import 'package:MJN/screens/accountScreen/AccountScreen.dart';
import 'package:MJN/screens/homeScreen/HomeScreen.dart';
import 'package:MJN/screens/notificationScreen/NotificationScreen.dart';
import 'package:MJN/screens/paymentScreen/PaymentScreen.dart';
import 'package:MJN/screens/tabScreens/tabScreens.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


void main() {
  runApp(
    new MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
            button: TextStyle(color: Colors.white),
          )),
      home: MyApp(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        PaymentScreen.routeName: (ctx) => PaymentScreen(),
        NotificationScreen.routeName: (ctx) => NotificationScreen(),
        AccountScreen.routeName: (ctx) => AccountScreen(),
        TabScreens.routeName: (ctx) => TabScreens(),
      },
    ),
  );
}

class TabScreen {
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new AfterSplash(),
        title: Text(
          'Loading...',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset(
          'assets/images/floating_icon.png',
        ),
        photoSize: 50,
        backgroundColor: Colors.blueAccent,
        loaderColor: Colors.red,
      ),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabScreens();
  }
}
