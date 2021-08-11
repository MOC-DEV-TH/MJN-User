import 'package:MJN/screens/accountScreen/AccountScreen.dart';
import 'package:MJN/screens/homeScreen/HomeScreen.dart';
import 'package:MJN/screens/notificationScreen/NotificationScreen.dart';
import 'package:MJN/screens/paymentScreen/PaymentScreen.dart';
import 'package:flutter/material.dart';

class TabScreens extends StatefulWidget {

  static const routeName = '/tab_screen';

  @override
  _TabScreensState createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {

  List<Map<String,Object>> _pages;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),

      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.home),
              title: Text(
                'Home',
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.payment),
              title: Text(
                'Payment',
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.notifications),
              title: Text(
                'Notification',
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.account_circle),
              title: Text(
                'My Account',
              )),
        ],
      ),
    );
  }
}
