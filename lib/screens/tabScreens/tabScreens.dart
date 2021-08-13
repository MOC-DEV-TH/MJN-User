import 'package:MJN/helpers/shared_pref.dart';
import 'package:MJN/screens/accountScreen/AccountScreen.dart';
import 'package:MJN/screens/homeScreen/HomeScreen.dart';
import 'package:MJN/screens/notificationScreen/NotificationScreen.dart';
import 'package:MJN/screens/paymentScreen/PaymentScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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


  int _selectedPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });

  }

  Widget getSelectedPage() {
    int pageIndex = 0;



    switch (pageIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return PaymentScreen();
      case 3:
        return NotificationScreen();
      case 4:
        return AccountScreen();

    }

    return HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 50),
                width: 100,
                child: Image.asset(
                  'assets/images/mjn_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            height: 50,
            width: 80,
            margin: EdgeInsets.only(bottom: 37, right: 30, top: 33),
            padding: EdgeInsets.all(2),
            child: Neumorphic(
              style: NeumorphicStyle(
                  color: Colors.white,
                  shape: NeumorphicShape.concave,
                  boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: -4,
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
                  setState(() {
                    selectedLang = value;
                    SharedPref.setData(SharedPref.language_status, value);
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10, bottom: 12)),
              ),
            ),
          ),
        ],
      ),
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


