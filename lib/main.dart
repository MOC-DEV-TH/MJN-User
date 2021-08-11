import 'package:flutter/material.dart';
import 'package:mjn_client/screens/accountScreen/AccountScreen.dart';
import 'package:mjn_client/screens/homeScreen/HomeScreen.dart';
import 'package:mjn_client/screens/notificationScreen/NotificationScreen.dart';
import 'package:mjn_client/screens/paymentScreen/PaymentScreen.dart';
import 'package:mjn_client/screens/tabScreens/tab_screen.dart';
void main() {
  runApp( new MaterialApp(
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
        TabsScreen.routeName: (ctx) => TabsScreen(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('')
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabsScreen();
  }
}
