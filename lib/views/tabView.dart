import 'package:MJN/Widgets/main_drawer.dart';
import 'package:MJN/views/ContactUsView.dart';
import 'package:MJN/views/ServiceComplainView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'AccountDetailView.dart';
import 'HomeView.dart';
import 'NotificationView.dart';
import 'PaymentView.dart';

class TabScreens extends StatefulWidget {
  static const routeName = '/tab_screen';

  @override
  _TabScreensState createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedLang = 'ENG';

  @override
  void initState() {
    super.initState();
  }

  int _selectedPageIndex = 2;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget getSelectedPage() {
    int pageIndex = 0;
    pageIndex = _selectedPageIndex;
    switch (pageIndex) {
      case 0:
        return NotificationView();
      case 1:
        return PaymentView();
      case 2:
        return HomeView();
      case 3:
        return ServiceComplainView();
      case 4:
        return ContactUsView();
    }

    return HomeView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 110,
        elevation: 2,
        backgroundColor: Colors.white70,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 27),
                child: Text('Welcome to Mojoenet',style: TextStyle(fontSize: 16,color: Colors.black),)
              ),
            ],
          ),
        ),
        actions: [
          Container(
            height: 50,
            width: 75,
            margin: EdgeInsets.only(bottom: 37, right: 30, top: 33),
            padding: EdgeInsets.all(3),
            child: Neumorphic(
              style: NeumorphicStyle(
                  color: Colors.white,
                  lightSource: LightSource.topLeft),
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                value: selectedLang,
                items: ["မြန်မာ", "ENG"]
                    .map((label) => DropdownMenuItem(
                  child: Text(
                    label,
                    style: TextStyle(fontSize: 12),
                  ),
                  value: label,
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                    contentPadding: EdgeInsets.only(left: 10, bottom: 12)),
              ),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: getSelectedPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Color(0xFFEEEEEE),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: (selectedLang == "ENG") ? 12 : 10,
        unselectedFontSize: (selectedLang == "ENG") ? 12 : 10,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.notifications),
              title: Text(
                'Notification',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.payment),
              title: Text(
                'Payment',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: FlutterLogo(size: 40,),
              title: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 1),
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.pending_actions_rounded),
              title: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Service Complain',
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                ),
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.phone),
              title: Text(
                'Contact Us',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
