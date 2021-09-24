import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NotificationView extends StatelessWidget {
  static const routeName = '/notification_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 10, left: 10),
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
          ],
        ),
      ),
    );
  }
}
