import 'package:MJN/NewViews/LoginView1.dart';
import 'package:MJN/NewViews/NewHomeView.dart';
import 'package:MJN/Widgets/main_drawer.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/views/AboutUsView.dart';
import 'package:MJN/views/ContactUsView.dart';
import 'package:MJN/views/LoginView.dart';
import 'package:MJN/views/NewLoginView.dart';
import 'package:MJN/views/ProductAndServiceView.dart';
import 'package:MJN/views/ServiceComplainView.dart';
import 'package:MJN/views/TermAndConditionView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
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

  bool isOpened = false;

  bool visible = false;

  String selectedLang = 'ENG';
  final langStorage = GetStorage();

  String dropdownvalue = 'Apple';
  var items = [
    'Apple',
    'Banana',
    'Grapes',
    'Orange',
    'watermelon',
    'Pineapple'
  ];

  @override
  void initState() {
    visible = false;
    super.initState();

    if (langStorage.read(LANGUAGE) == 'မြန်မာ') {
      setState(() {
        selectedLang = 'မြန်မာ';
      });
    } else if (langStorage.read(LANGUAGE) == 'ENG') {
      setState(() {
        selectedLang = 'ENG';
      });
    }
  }

  int _selectedPageIndex = 2;
  int changePageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      changePageIndex = 0;
      _selectedPageIndex = index;
    });
  }

  _showPopupMenu() {
    showMenu<String>(
      color: Color(0xff242527),
      context: context,
      position: RelativeRect.fromLTRB(0.0, 100.0, 0.0, 0.0),
      //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child:
                const Text('About Us', style: TextStyle(color: Colors.white)),
            value: '1'),
        PopupMenuItem<String>(
            child: const Text(
              'Product and Services',
              style: TextStyle(color: Colors.white),
            ),
            value: '2'),
        PopupMenuItem<String>(
            child: const Text('Terms & Conditions',
                style: TextStyle(color: Colors.white)),
            value: '3'),
        PopupMenuItem<String>(
            child:
                const Text('Contact Us', style: TextStyle(color: Colors.white)),
            value: '4'),
        PopupMenuItem<String>(
            child:
                const Text('My Account', style: TextStyle(color: Colors.white)),
            value: '5'),
        PopupMenuItem<String>(
            child: visible
                ? Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              visible = false;
                              Navigator.pop(context);
                              _showPopupMenu();
                            });
                          },
                          child: const Text('User Manual',
                              style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: InkWell(
                            onTap: () {
                              print('Login Manual');
                            },
                            child: const Text('Login Manual',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: InkWell(
                            onTap: () {
                              print('Service Ticket Manual');
                            },
                            child: const Text('Service Ticket Manual',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: InkWell(
                            onTap: () {
                              print('Online Payment Manual');
                            },
                            child: const Text('Online Payment Manual',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                : Text('User Manual', style: TextStyle(color: Colors.white)),
            value: '6'),
        PopupMenuItem<String>(
            child: visible
                ? Column(
                    children: [
                      Text(langStorage.read(TOKEN) != null ? 'Logout' : 'Login',
                          style: TextStyle(color: Colors.white)),
                    ],
                  )
                : Text(langStorage.read(TOKEN) != null ? 'Logout' : 'Login',
                    style: TextStyle(color: Colors.white)),
            value: '7'),
      ],
      elevation: 8.0,
    ).then<void>((String itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        setState(() {
          changePageIndex = 5;
        });
      } else if (itemSelected == "2") {
        setState(() {
          changePageIndex = 6;
        });
      } else if (itemSelected == "3") {
        setState(() {
          changePageIndex = 7;
        });
      } else if (itemSelected == "4") {
        setState(() {
          changePageIndex = 8;
        });
      } else if (itemSelected == "5") {
        setState(() {
          changePageIndex = 9;
        });
      } else if (itemSelected == "6") {
        setState(() {
          visible = true;
          _showPopupMenu();
        });
      } else if (itemSelected == '7') {
        langStorage.read(TOKEN) != null
            ? AppUtils.showLogoutDialog('Logout',
                'Are you sure you want to exit\nthis application?', context)
            : Navigator.of(context).pushReplacementNamed(LoginView1.routeName);
      }
    });
  }

  _showUserManualPopupMenu() {
    return Container(
        color: Color(0xff242527),
        child: Column(
          children: [
            Text('Login Manual'),
            Text('Login Manual'),
            Text('Login Manual'),
          ],
        ));
  }

  Widget getSelectedPage() {
    int pageIndex = 0;
    pageIndex = (changePageIndex == 5 ||
            changePageIndex == 6 ||
            changePageIndex == 7 ||
            changePageIndex == 8 ||
            changePageIndex == 9)
        ? changePageIndex
        : _selectedPageIndex;
    switch (pageIndex) {
      case 0:
        return NotificationView();
      case 1:
        return PaymentView();
      case 2:
        return NewHomeView();
      case 3:
        return ServiceComplainView();
      case 4:
        return ContactUsView();
      case 5:
        return AboutUsView();
      case 6:
        return ProductAndServiceView();
      case 7:
        return TermAndConditionView();
      case 8:
        return ContactUsView();
      case 9:
        return AccountView();
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
        backgroundColor: Color(0xff242527),
        iconTheme: IconThemeData(color: Colors.grey),
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 27),
                  child: GestureDetector(
                      onTap: () {
                        _showPopupMenu();
                      },
                      child: Icon((Icons.dehaze_rounded)))),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 27),
                  child: Text(
                    'Welcome to Mojoenet',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
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
                  color: Colors.white, lightSource: LightSource.topLeft),
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
                    if (value == 'မြန်မာ') {
                      langStorage.write(LANGUAGE, value);
                      var locale = Locale('my', 'MM');
                      Get.updateLocale(locale);
                    } else if (value == 'ENG') {
                      langStorage.write(LANGUAGE, value);
                      var locale = Locale('en', 'US');
                      Get.updateLocale(locale);
                    }
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    contentPadding: EdgeInsets.only(left: 10, bottom: 12)),
              ),
            ),
          ),
        ],
      ),
      body: getSelectedPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Color(0xff242527),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: (selectedLang == "ENG") ? 12 : 10,
        unselectedFontSize: (selectedLang == "ENG") ? 12 : 10,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.notifications),
              title: Text(
                'Notification',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.payment),
              title: Text(
                'Payment',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: FlutterLogo(
                size: 40,
              ),
              title: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 1),
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.pending_actions_rounded),
              title: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Service Complain',
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                ),
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
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
