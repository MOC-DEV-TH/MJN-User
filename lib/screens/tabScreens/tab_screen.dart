import 'package:flutter/material.dart';
import 'package:mjn_client/screens/accountScreen/AccountScreen.dart';
import 'package:mjn_client/screens/homeScreen/HomeScreen.dart';
import 'package:mjn_client/screens/notificationScreen/NotificationScreen.dart';
import 'package:mjn_client/screens/paymentScreen/PaymentScreen.dart';


class TabsScreen extends StatefulWidget {
  static const routeName = '/tab_screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}
late List<Map<String, Object>> _pages;

class _TabsScreenState extends State<TabsScreen> {

  @override
  void initState() {

    _pages = [
      {
        'page': HomeScreen(),
        'title': 'Home',
      },
      {
        'page': PaymentScreen(),
        'title': 'Payment',
      },
      {
        'page': NotificationScreen(),
        'title': 'Notification',
      },
      {
        'page': AccountScreen(),
        'title': 'My Account',
      },
    ];


    super.initState();
  }

  int _selectedPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
