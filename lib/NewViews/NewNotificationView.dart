import 'package:MJN/Widgets/new_notification_items.dart';
import 'package:MJN/Widgets/notification_items.dart';
import 'package:MJN/models/notificationModelVO.dart';
import 'package:MJN/presistence/db/database_util.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NewNotificationView extends StatefulWidget {
  static const routeName = '/notification_screen';
  @override
  _NewNotificationViewState createState() => _NewNotificationViewState();
}

class _NewNotificationViewState extends State<NewNotificationView> {

  List<NotificationModelVO> notificationLists = <NotificationModelVO>[];
  bool bDataRetrievedLately = false;
  String _value = "";

  final List<String> notilists = <String>[
    'Aby',
    'Aish',
    'Aby',
    'Aish',
  ];

  bool isExpanded = false;

  String text = "Flutter has its own UI components, along with an engine to render them on both the Android and iOS platforms. Most of those UI components, right out of the box, conform to the guidelines of Material Design.";

  void retrieveNotiFromDatabase() {
    Future<List<NotificationModelVO>> notimodels = DatabaseUtil().getAllNotiModels();
    notimodels.then((value) {
      notificationLists = value;
      setState(() {
        bDataRetrievedLately = true;
      });
      print(notificationLists.length);

    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      retrieveNotiFromDatabase();
    }
  }




  @override
  Widget build(BuildContext context) {
    retrieveNotiFromDatabase();

    if(bDataRetrievedLately && notificationLists != null) {

      bDataRetrievedLately = false;

      return Scaffold(
        backgroundColor: Color(0xff188FC5),
        body:
        GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text('Unread Messages',style: TextStyle(color: Colors.white),),

                  Container(
                    width: 60,
                    height: 30,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 10,),
                    child: NeumorphicButton(
                      onPressed: () {},
                      child: Text(
                        "View",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Color(0xff188FC5)),
                      ),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(8)),
                        color: Colors.white,
                        depth: -8,
//                lightSource: LightSource.topLeft,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        height: 40,
                        padding: EdgeInsets.only(bottom: 6),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 20,),


                   Icon(Icons.search,color: Colors.white,size: 35,),

                      SizedBox(width: 10,),

                      PopupMenuButton(
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(Icons.more_vert,color: Colors.white,size: 25,),
                          ),
                          elevation: 20,
                          enabled: true,
                          onSelected: (value) {
                            setState(() {
                              _value = value;
                            });
                            if(_value == 'one'){
                              AppUtils.showErrorSnackBar('Success', 'Mark all as read');
                            }
                            else if(_value == 'two'){
                              AppUtils.showErrorSnackBar('Success', 'Delete all');
                            }
                          },
                          itemBuilder:(context) => [
                            PopupMenuItem(
                              child: Text("Mark all as read"),
                              value: "one",
                            ),
                            PopupMenuItem(
                              child: Text("Delete all"),
                              value: "two",
                            ),
                          ]
                      )

                  ],),


                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {

                      return NewNotificationItems(text);
                    },
                    itemCount: notilists.length,
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    }
    else {
      return Container();
    }

  }
}


