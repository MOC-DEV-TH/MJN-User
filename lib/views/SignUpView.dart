import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SignUpView extends StatelessWidget {
  static const routeName = '/sign_up';
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
  var buildingText = TextEditingController();
  var unitText = TextEditingController();
  var contactNumberText = TextEditingController();

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.white70,
        title: Text('Sign Up'),
      ),
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [

                  Text(
                    'Please fill up required information',
                    style: TextStyle(fontSize: 18),
                  ),

                  Row(
                    children: [
                      Container(
                        width: 150,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 45,
                              ),
                              Text(
                                'Building',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 45,
                              ),
                              Text(
                                'Unit',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                'Contact Number',
                                style: TextStyle(fontSize: 16),
                              ),
                            ]),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: 40,
                              decoration:
                              BoxDecoration(border: Border.all(color: Colors.greenAccent),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: buildingText,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              decoration:
                              BoxDecoration(border: Border.all(color: Colors.greenAccent),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: unitText,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              decoration:
                              BoxDecoration(border: Border.all(color: Colors.greenAccent),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: contactNumberText,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),


                  SizedBox(
                    height: 50,
                  ),

                  Container(
                    width: 200,
                    child: NeumorphicButton(
                      onPressed: () {
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Text(
                            "Sign Up",
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
          )),
    );
  }
}
