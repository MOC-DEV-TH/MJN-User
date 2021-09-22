import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ChangePasswordView extends StatelessWidget {

  var currentPasswordText = TextEditingController();
  var newPasswordText = TextEditingController();
  var rewriteNewPasswordText = TextEditingController();


  static const routeName = '/change_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 80,
            ),
            Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: -4,
                lightSource: LightSource.topLeft,
//                    color: Colors.grey
              ),
              child: TextField(
                controller: currentPasswordText,
                decoration: InputDecoration(
                    hintText: "Current Password",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: -4,
                lightSource: LightSource.topLeft,
//                    color: Colors.grey
              ),
              child: TextField(
                controller: newPasswordText,
                decoration: InputDecoration(
                    hintText: "New Password",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: -4,
                lightSource: LightSource.topLeft,
//                    color: Colors.grey
              ),
              child: TextField(
                controller: rewriteNewPasswordText,
                decoration: InputDecoration(
                    hintText: "Rewrite New Password",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10)),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.only(left: 130, right: 130),
              child: NeumorphicButton(
                onPressed: () {},
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(18)),
                  color: Colors.amber,
                  depth: 8,
//                lightSource: LightSource.topLeft,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
