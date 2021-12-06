import 'package:MJN/CustomDialog/CustomDialogUI.dart';
import 'package:MJN/NewViews/NewAboutUsView.dart';
import 'package:MJN/NewViews/NewContactUsView.dart';
import 'package:MJN/NewViews/NewHomeView.dart';
import 'package:MJN/NewViews/NewNotificationView.dart';
import 'package:MJN/NewViews/NewPaymentView.dart';
import 'package:MJN/NewViews/NewProductAndServiceView.dart';
import 'package:MJN/NewViews/NewServiceComplainView.dart';
import 'package:MJN/NewViews/NewTermAndConditionView.dart';
import 'package:MJN/NewViews/OnlinePaymentView.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'AccountDetailView.dart';

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

  @override
  void initState() {
    changePageIndex = 0;
    visible = false;
    isSelected = [true, false];
    super.initState();

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
    setState(() {
      changePageIndex = 0;
      _selectedPageIndex = index;
      navSelectedIndex = true;
    });
  }

  // _showPopupMenu() {
  //   showMenu<String>(
  //     color: Color(0xff242527),
  //     context: context,
  //     position: RelativeRect.fromLTRB(0.0, 100.0, 0.0, 0.0),
  //     //position where you want to show the menu on screen
  //     items: [
  //       PopupMenuItem<String>(
  //           child:
  //           const Text('About Us', style: TextStyle(color: Colors.white)),
  //           value: '1'),
  //       PopupMenuItem<String>(
  //           child: const Text(
  //             'Product and Services',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //           value: '2'),
  //       PopupMenuItem<String>(
  //           child: const Text('Terms & Conditions',
  //               style: TextStyle(color: Colors.white)),
  //           value: '3'),
  //       PopupMenuItem<String>(
  //           child:
  //           const Text('Contact Us', style: TextStyle(color: Colors.white)),
  //           value: '4'),
  //       PopupMenuItem<String>(
  //           child:
  //           const Text('My Account', style: TextStyle(color: Colors.white)),
  //           value: '5'),
  //       PopupMenuItem<String>(
  //           child: visible
  //               ? Container(
  //             alignment: Alignment.topLeft,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 InkWell(
  //                   onTap: () {
  //                     setState(() {
  //                       visible = false;
  //                       Navigator.pop(context);
  //                       _showPopupMenu();
  //                     });
  //                   },
  //                   child: const Text('User Manual',
  //                       style: TextStyle(color: Colors.white)),
  //                 ),
  //                 SizedBox(
  //                   height: 15,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 6),
  //                   child: InkWell(
  //                     onTap: () {
  //                       print('Login Manual');
  //                     },
  //                     child: const Text('Login Manual',
  //                         textAlign: TextAlign.left,
  //                         style: TextStyle(
  //                           fontSize: 13,
  //                           color: Colors.grey,
  //                         )),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 6),
  //                   child: InkWell(
  //                     onTap: () {
  //                       print('Service Ticket Manual');
  //                     },
  //                     child: const Text('Service Ticket Manual',
  //                         textAlign: TextAlign.left,
  //                         style: TextStyle(
  //                           fontSize: 13,
  //                           color: Colors.grey,
  //                         )),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 6),
  //                   child: InkWell(
  //                     onTap: () {
  //                       print('Online Payment Manual');
  //                     },
  //                     child: const Text('Online Payment Manual',
  //                         textAlign: TextAlign.left,
  //                         style: TextStyle(
  //                           fontSize: 13,
  //                           color: Colors.grey,
  //                         )),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           )
  //               : Text('User Manual', style: TextStyle(color: Colors.white)),
  //           value: '6'),
  //       PopupMenuItem<String>(
  //           child: visible
  //               ? Column(
  //             children: [
  //               Text(langStorage.read(TOKEN) != null ? 'Logout' : 'Login',
  //                   style: TextStyle(color: Colors.white)),
  //             ],
  //           )
  //               : Text(langStorage.read(TOKEN) != null ? 'Logout' : 'Login',
  //               style: TextStyle(color: Colors.white)),
  //           value: '7'),
  //     ],
  //     elevation: 8.0,
  //   ).then<void>((String itemSelected) {
  //     if (itemSelected == null) return;
  //
  //     if (itemSelected == "1") {
  //       setState(() {
  //         changePageIndex = 5;
  //         navSelectedIndex = false;
  //       });
  //     } else if (itemSelected == "2") {
  //       setState(() {
  //         changePageIndex = 6;
  //         navSelectedIndex = false;
  //       });
  //     } else if (itemSelected == "3") {
  //       setState(() {
  //         changePageIndex = 7;
  //         navSelectedIndex = false;
  //       });
  //     } else if (itemSelected == "4") {
  //       setState(() {
  //         changePageIndex = 8;
  //         navSelectedIndex = false;
  //       });
  //     } else if (itemSelected == "5") {
  //       setState(() {
  //         changePageIndex = 9;
  //         navSelectedIndex = false;
  //       });
  //     } else if (itemSelected == "6") {
  //       setState(() {
  //         visible = true;
  //         _showPopupMenu();
  //       });
  //     } else if (itemSelected == '7') {
  //       langStorage.read(TOKEN) != null
  //           ? AppUtils.showLogoutDialog('Logout',
  //           'Are you sure you want to exit\nthis application?', context)
  //           : Navigator.of(context).pushReplacementNamed(LoginView1.routeName);
  //     }
  //   });
  // }

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
        return NewNotificationView();
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
        return NewContactUsView();
      case 9:
        return AccountView();
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
    // showGeneralDialog(
    //   barrierDismissible: true,
    //   barrierLabel: '',
    //   barrierColor: Colors.black.withOpacity(0.5),
    //   transitionDuration: Duration(milliseconds: 700),
    //   context: context,
    //   pageBuilder: (context, anim1, anim2) {
    //     return Align(
    //       alignment:  Alignment.topLeft,
    //       child: Container(
    //         height: 300,
    //         width: 200,
    //         child: _buildMenuItems(context),
    //         margin: EdgeInsets.only(top: 120, left: 1,),
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(40),
    //         ),
    //       ),
    //     );
    //   },
    //   transitionBuilder: (context, anim1, anim2, child) {
    //     return SlideTransition(
    //       position: Tween(begin: Offset(0, _fromTop ? -1 : 1), end: Offset(0, 0)).animate(anim1),
    //       child: child,
    //     );
    //   },
    // );

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
            child:
                Container(margin: EdgeInsets.only(top: 56), child: DialogUI(key: _scaffoldKey,)),
          );
        });
  }

  // Widget _buildMenuItems(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       padding: EdgeInsets.only(top: 20, bottom: 20),
  //       alignment: Alignment.center,
  //       color: Color(0xff242527),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Expanded(
  //               child: InkWell(
  //                   onTap: () {
  //                     Navigator.of(context).pop();
  //
  //                     setState(() {
  //                       changePageIndex = 5;
  //                       navSelectedIndex = false;
  //                     });
  //                   },
  //                   child: Text('About Us',
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 14,
  //                           decoration: TextDecoration.none)))),
  //           Expanded(
  //               child: InkWell(
  //                 onTap: () {
  //                   Navigator.of(context).pop();
  //                   setState(() {
  //                     changePageIndex = 6;
  //                     navSelectedIndex = false;
  //                   });
  //                 },
  //                 child: Text('Product and Services',
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 14,
  //                         decoration: TextDecoration.none)),
  //               )),
  //           Expanded(
  //               child: InkWell(
  //                 onTap: () {
  //                   Navigator.of(context).pop();
  //                   setState(() {
  //                     changePageIndex = 7;
  //                     navSelectedIndex = false;
  //                   });
  //                 },
  //                 child: Text('Terms & Conditions',
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 14,
  //                         decoration: TextDecoration.none)),
  //               )),
  //           Expanded(
  //               child: InkWell(
  //                   onTap: () {
  //                     Navigator.of(context).pop();
  //                     setState(() {
  //                       changePageIndex = 8;
  //                       navSelectedIndex = false;
  //                     });
  //                   },
  //                   child: Text('Contact Us',
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 14,
  //                           decoration: TextDecoration.none)))),
  //           Expanded(
  //               child: InkWell(
  //                   onTap: () {
  //                     Navigator.of(context).pop();
  //                     setState(() {
  //                       changePageIndex = 9;
  //                       navSelectedIndex = false;
  //                     });
  //                   },
  //                   child: Text('My Account',
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 14,
  //                           decoration: TextDecoration.none)))),
  //           Expanded(
  //               child: InkWell(
  //                   onTap: () {
  //                     setState(() {
  //                       manualOne = 'Login Manual';
  //                       manualTwo = 'Service Ticket Manual';
  //                       manualThree = 'Online Payment Manual';
  //                     });
  //                   },
  //                   child: Text('User Manual',
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           decoration: TextDecoration.none,
  //                           fontSize: 14)))),
  //
  //           Expanded(
  //               child: InkWell(
  //                   onTap: () {
  //                     Navigator.of(context).pop();
  //                     setState(() {});
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 10),
  //                     child: Text(manualOne,
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 12,
  //                             decoration: TextDecoration.none)),
  //                   ))),
  //
  //
  //           Expanded(
  //               child: InkWell(
  //                   onTap: () {
  //                     Navigator.of(context).pop();
  //                     setState(() {});
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 10),
  //                     child: Text(manualTwo,
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 12,
  //                             decoration: TextDecoration.none)),
  //                   ))),
  //
  //
  //           Expanded(
  //               child: InkWell(
  //                   onTap: () {
  //                     Navigator.of(context).pop();
  //                     setState(() {});
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 10),
  //                     child: Text(manualThree,
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 12,
  //                             decoration: TextDecoration.none)),
  //                   ))),
  //
  //
  //           InkWell(
  //             onTap: () {
  //               langStorage.read(TOKEN) != null
  //                   ? AppUtils.showLogoutDialog(
  //                   'Logout',
  //                   'Are you sure you want to exit\nthis application?',
  //                   context)
  //                   : Navigator.of(context)
  //                   .pushReplacementNamed(LoginView1.routeName);
  //             },
  //             child: Text(langStorage.read(TOKEN) != null ? 'Logout' : 'Login',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 14,
  //                     decoration: TextDecoration.none)),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget logoAndNavTitleAppBar(int navSelectPage) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 90,
      elevation: 2,
      backgroundColor: Color(0xff242527),
      iconTheme: IconThemeData(color: Colors.grey),
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(right: 40),
                child: GestureDetector(
                    onTap: () {

                        showMenuDialog(context);
                    },
                    child: Icon((Icons.dehaze_rounded)))),
            navSelectPage == 0
                ? Container(
                    padding: EdgeInsets.only(right: 80),
                    child: Text(
                      'Notification',
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                : navSelectPage == 1
                    ? Container(
                        padding: EdgeInsets.only(right: 80),
                        child: Text(
                          'Payment',
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    : navSelectPage == 3
                        ? Container(
                            padding: EdgeInsets.only(right: 60),
                            child: Text(
                              'Service Complain',
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        : navSelectPage == 4
                            ? Container(
                                padding: EdgeInsets.only(right: 80),
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(left: 65, right: 50),
                                width: 100,
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/splash_screen_logo.png'))),
          ],
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20, top: 30, bottom: 30),
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

  Widget titleAppBar(int pageIndex) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 90,
      elevation: 2,
      backgroundColor: Color(0xff242527),
      iconTheme: IconThemeData(color: Colors.grey),
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: GestureDetector(
                    onTap: () {

                        showMenuDialog(context);
                    },
                    child: Icon((Icons.dehaze_rounded)))),
            pageIndex == 5
                ? Container(
                    padding: EdgeInsets.only(right: 80),
                    child: Text(
                      'About Us',
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                : pageIndex == 6
                    ? Container(
                        padding: EdgeInsets.only(right: 40),
                        child: Text(
                          'Product And Services',
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    : pageIndex == 7
                        ? Container(
                            padding: EdgeInsets.only(right: 40),
                            child: Text(
                              'Terms & Conditions',
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        : pageIndex == 8
                            ? Container(
                                padding: EdgeInsets.only(right: 80),
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            : pageIndex == 9
                                ? Container(
                                    padding: EdgeInsets.only(right: 80),
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
          margin: EdgeInsets.only(right: 20, top: 30, bottom: 30),
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
        preferredSize: const Size.fromHeight(100),
        child :navSelectedIndex
            ? logoAndNavTitleAppBar(_selectedPageIndex)
            : titleAppBar(changePageIndex),
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
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.payment),
              title: Text(
                'Payment',
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
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
                getSelectedPage();
              });
            },
          ),
        ),
      ),
    );
  }
}
