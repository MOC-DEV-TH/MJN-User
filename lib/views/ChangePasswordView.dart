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
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: TextField(
                    controller: currentPasswordText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Current Password",
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: TextField(
                    controller: newPasswordText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "New Password",
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: TextField(
                    controller: rewriteNewPasswordText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Rewrite New Password",
                    )),
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
