import 'dart:async';

import 'package:MJN/CustomDialog/CustomDialogUI.dart';
import 'package:MJN/NewViews/MyAccountView.dart';
import 'package:MJN/NewViews/NewAboutUsView.dart';
import 'package:MJN/NewViews/NewContactUsView.dart';
import 'package:MJN/NewViews/NewHomeView.dart';
import 'package:MJN/NewViews/NewNotificationView.dart';
import 'package:MJN/NewViews/NewProductAndServiceView.dart';
import 'package:MJN/NewViews/NewServiceComplainView.dart';
import 'package:MJN/NewViews/NewTermAndConditionView.dart';
import 'package:MJN/NewViews/OnlinePaymentView.dart';
import 'package:MJN/models/notificationModelVO.dart';
import 'package:MJN/presistence/database/MyAppDatabase.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/utils/eventbus_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class TabScreens extends StatefulWidget {
  static const routeName = '/tab_screen';

  int pageIndex;

  TabScreens(this.pageIndex);

  @override
  _TabScreensState createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isOpened = false;
  var notiCount = 0.obs;

  bool visible = false;
  bool pageSelectedIndex = false;
  bool navSelectedIndex = true;

  bool isVisible = false;

  String manualOne = '';
  String manualTwo = '';
  String manualThree = '';

  late int menuPageIndex;
  late List<bool> isSelected;

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

  late StreamSubscription notiSub;

  @override
  void initState() {
    changePageIndex = 0;
    visible = false;
    isSelected = [true, false];
    super.initState();

    notiSub =
        EventBusUtils.getInstance().on<NotificationModelVO>().listen((event) {
      print("NOTI EVENT " + event.title);

      MyAppDatabase.notificationDao!
          .fetchUnreadNotifications()
          .then((value) => {notiCount.value = value.length});
    });

    notiSub = EventBusUtils.getInstance().on().listen((event) {
      if (event.toString() == 'DeleteAll')
        MyAppDatabase.notificationDao!
            .fetchUnreadNotifications()
            .then((value) => {notiCount.value = value.length});
    });

    notiSub = EventBusUtils.getInstance().on().listen((event) {
      if (event.toString() == 'MarkAll')
        MyAppDatabase.notificationDao!
            .fetchUnreadNotifications()
            .then((value) => {notiCount.value = value.length});
    });

    notiSub = EventBusUtils.getInstance().on().listen((event) {
      if (event.toString() == 'Update')
        MyAppDatabase.notificationDao!
            .fetchUnreadNotifications()
            .then((value) => {notiCount.value = value.length});
    });

    MyAppDatabase.notificationDao!
        .fetchUnreadNotifications()
        .then((value) => {notiCount.value = value.length});

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      menuPageIndex = widget.pageIndex;
      if (menuPageIndex == 1) {
        setState(() {
          changePageIndex = 5;
          navSelectedIndex = false;
        });
      } else if (menuPageIndex == 2) {
        setState(() {
          changePageIndex = 6;
          navSelectedIndex = false;
        });
      } else if (menuPageIndex == 3) {
        setState(() {
          changePageIndex = 7;
          navSelectedIndex = false;
        });
      } else if (menuPageIndex == 4) {
        setState(() {
          changePageIndex = 8;
          navSelectedIndex = false;
        });
      } else if (menuPageIndex == 5) {
        setState(() {
          changePageIndex = 9;
          navSelectedIndex = false;
        });
      } else {
        setState(() {
          navSelectedIndex = true;
        });
      }
    });

    if (langStorage.read(LANGUAGE) == 'MY') {
      setState(() {
        isSelected = [false, true];
      });
    } else if (langStorage.read(LANGUAGE) == 'EN') {
      setState(() {
        isSelected = [true, false];
      });
    }
  }

  int _selectedPageIndex = 2;
  int changePageIndex = 0;

  void _selectPage(int index) {
    if (langStorage.read(TOKEN) != null) {
      setState(() {
        changePageIndex = 0;
        _selectedPageIndex = index;
        navSelectedIndex = true;
      });
    } else {
      AppUtils.showLoginDialog(
          'Login', 'Please sign in to unlock all\naccount features', context);
    }
  }

  Widget getSelectedPage() {
    int pageIndex = 0;
    print(changePageIndex);
    pageIndex = (changePageIndex == 5 ||
            changePageIndex == 6 ||
            changePageIndex == 7 ||
            changePageIndex == 8 ||
            changePageIndex == 9 ||
            changePageIndex == 10)
        ? changePageIndex
        : _selectedPageIndex;
    switch (pageIndex) {
      case 0:
        {
          return NewNotificationView(MyAppDatabase.notificationDao!);
        }
      case 1:
        return OnlinePaymentView();
      case 2:
        return NewHomeView();
      case 3:
        return NewServiceComplainView();
      case 4:
        return NewContactUsView();
      case 5:
        return NewAboutUsView();
      case 6:
        return NewProductAndServiceView();
      case 7:
        return NewTermAndConditionView();
      case 8:
        {
          if (langStorage.read(TOKEN) == null) {
            AppUtils.showLoginDialog('Login',
                'Please sign in to unlock all\naccount features', context);

            break;
          } else
            return NewContactUsView();
        }

      case 9:
        return MyAccountView();
      case 10:
        return NewHomeView();
    }

    return NewHomeView();
  }

  double _buttonWidth(BuildContext context) {
    final maxWidth = 20.0;
    final buttonCount = 2;

    final width = (MediaQuery.of(context).size.width - 200) / buttonCount;
    if (width < maxWidth) {
      return width;
    } else {
      return maxWidth;
    }
  }

  void showMenuDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return SafeArea(
            child: Container(
                margin: EdgeInsets.only(top: 50), child: DialogUI(context)),
          );
        });
  }

  Widget logoAndNavTitleAppBar(int navSelectPage, BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 90,
      elevation: 2,
      backgroundColor: Color(0xff242527),
      iconTheme: IconThemeData(color: Colors.grey),
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(right: 40),
                child: GestureDetector(
                  onTap: () {
                    showMenuDialog(context);
                  },
                  child: Image(
                    image: AssetImage('assets/images/menu_icon.png'),
                    height: 24,
                    width: 23,
                  ),
                )),
            navSelectPage == 0
                ? Container(
                    padding: EdgeInsets.only( top: 5,left: 40),
                    child: Text(
                      'Notification',
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                : navSelectPage == 1
                    ? Container(
                        padding: EdgeInsets.only( top: 5,left: 60),
                        child: Text(
                          'Payment',
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    : navSelectPage == 3
                        ? Container(
                            padding: EdgeInsets.only( top: 5,left: 40),
                            child: Text(
                              'Service Complain',
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        : navSelectPage == 4
                            ? Container(
              padding: EdgeInsets.only( top: 5,left: 60),
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            : Container(
                                width: 100,
                                margin: EdgeInsets.only(left: 40),
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/splash_screen_logo.png'))),
          ],
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20,top: 24,bottom: 24 ),
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: ToggleButtons(
            constraints: BoxConstraints.tight(Size(35, 35)),
            selectedColor: Colors.white,
            borderRadius: BorderRadius.circular(5),
            fillColor: Colors.blue,
            children: [
              Container(
                alignment: Alignment.center,
                width: _buttonWidth(context),
                child: Text(
                  'EN',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: _buttonWidth(context),
                child: Text(
                  'MY',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < isSelected.length; i++) {
                  isSelected[i] = i == index;
                }

                if (index == 0) {
                  langStorage.write(LANGUAGE, 'EN');
                  var locale = Locale('en', 'US');
                  Get.updateLocale(locale);
                } else {
                  langStorage.write(LANGUAGE, 'MY');
                  var locale = Locale('my', 'MM');
                  Get.updateLocale(locale);
                }
              });
            },
            isSelected: isSelected,
          ),
        ),
      ],
    );
  }

  Widget titleAppBar(int pageIndex, BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 90,
      elevation: 2,
      backgroundColor: Color(0xff242527),
      iconTheme: IconThemeData(color: Colors.grey),
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: GestureDetector(
                onTap: () {
                  showMenuDialog(context);
                },
                child: Image(
                  image: AssetImage('assets/images/menu_icon.png'),
                  height: 24,
                  width: 23,
                ),
              ),
            ),
            pageIndex == 5
                ? Container(
                    padding: EdgeInsets.only( top: 5,left: 85),
                    child: Text(
                      'About Us',
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                : pageIndex == 6
                    ? Container(
                        padding: EdgeInsets.only( top: 5,left: 65),
                        child: Text(
                          'Product And Services',
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    : pageIndex == 7
                        ? Container(
                            padding: EdgeInsets.only( top: 5,left: 65),
                            child: Text(
                              'Terms & Conditions',
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        : pageIndex == 8
                            ? Container(
                                padding: EdgeInsets.only( top: 5,left: 85),
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            : pageIndex == 9
                                ? Container(
                                    padding: EdgeInsets.only( top: 5,left: 85),
                                    child: Text(
                                      'My Account',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  )
                                : Container(
                                    margin:
                                        EdgeInsets.only(left: 65, right: 50),
                                    child: Text(''),
                                  ),
          ],
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20,top: 24,bottom: 24 ),
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: ToggleButtons(
            constraints: BoxConstraints.tight(Size(35, 35)),
            selectedColor: Colors.white,
            borderRadius: BorderRadius.circular(5),
            fillColor: Colors.blue,
            children: [
              Container(
                alignment: Alignment.center,
                width: _buttonWidth(context),
                child: Text(
                  'EN',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: _buttonWidth(context),
                child: Text(
                  'MY',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < isSelected.length; i++) {
                  isSelected[i] = i == index;
                }
                if (index == 0) {
                  langStorage.write(LANGUAGE, 'EN');
                  var locale = Locale('en', 'US');
                  Get.updateLocale(locale);
                } else {
                  langStorage.write(LANGUAGE, 'MY');
                  var locale = Locale('my', 'MM');
                  Get.updateLocale(locale);
                }
              });
            },
            isSelected: isSelected,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.pageIndex);

    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: navSelectedIndex
            ? logoAndNavTitleAppBar(_selectedPageIndex, context)
            : titleAppBar(changePageIndex, context),
      ),
      body: getSelectedPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Color(0xff242527),
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: (selectedLang == "ENG") ? 12 : 10,
        unselectedFontSize: (selectedLang == "ENG") ? 12 : 10,
        items: [
          BottomNavigationBarItem(
            icon: new Stack(
              children: <Widget>[
                new Icon(
                  Icons.notifications,
                ),
                new Positioned(
                    right: 0,
                    child: Obx(() {
                      if (notiCount.value == 0) {
                        return Container();
                      } else {
                        return Container(
                          padding: EdgeInsets.all(1),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 12,
                            minHeight: 12,
                          ),
                          child: Text(
                            notiCount.value.toString(),
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                    }))
              ],
            ),
            title: Text(
              'Notifications',
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              activeIcon: Image.asset(
                'assets/images/active_payment_icon.png',
                width: 20,
                height: 20,
              ),
              icon: Image.asset(
                'assets/images/payment_icon.png',
                width: 20,
                height: 20,
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  'Payment',
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                ),
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.notifications,
                size: 5.0,
                color: Color(0x00FFFFFF),
              ),
              title: Text(
                '',
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              activeIcon: Image.asset(
                'assets/images/active_service_complain_icon.png',
                width: 20,
                height: 20,
              ),
              icon: Image.asset(
                'assets/images/service_complain_icon.png',
                width: 20,
                height: 20,
              ),
              title: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    'Service Complain',
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              activeIcon: Image.asset(
                'assets/images/active_contact_us_icon.png',
                width: 20,
                height: 20,
              ),
              icon: Image.asset(
                'assets/images/contact_us_icon.png',
                width: 20,
                height: 20,
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 68,
        width: 68,
        child: Visibility(
          visible: !keyboardIsOpen,
          child: FloatingActionButton(
            backgroundColor: Color(0xff242527),
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Image(image: AssetImage('assets/images/home.png')),
            ),
            onPressed: () {
              setState(() {
                changePageIndex = 10;
                _selectedPageIndex = 2;
                navSelectedIndex = true;
                getSelectedPage();
              });
            },
          ),
        ),
      ),
    );
  }
}
