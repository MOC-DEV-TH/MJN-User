import 'package:MJN/Widgets/notification_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NotificationView extends StatelessWidget {
  static const routeName = '/notification_screen';
  final List<String> notificationLists = <String>[
    '',
    '',
    '',
    '',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 20,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 10, left: 27),
              child: NeumorphicButton(
                onPressed: () {},
                child: Text(
                  "Notifications",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                  color: Colors.blue,
                  depth: 8,
//                lightSource: LightSource.topLeft,
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return NotificationItems(notificationLists[index]);
              },
              itemCount: notificationLists.length,
            ),

          ],
        ),
      ),
    );
  }
}
