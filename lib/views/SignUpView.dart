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
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text('Sign Up'),
      ),
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Please fill up required information'),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Building'),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height,
                          maxWidth: 200,
                          minWidth: 30),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          depth: -4,
                          lightSource: LightSource.topLeft,
//                    color: Colors.grey
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextField(
                            controller: buildingText,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Unit'),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height,
                          maxWidth: 200,
                          minWidth: 30),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          depth: -4,
                          lightSource: LightSource.topLeft,
//                    color: Colors.grey
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextField(
                            controller: unitText,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Contact Number'),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height,
                          maxWidth: 200,
                          minWidth: 30),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          depth: -4,
                          lightSource: LightSource.topLeft,
//                    color: Colors.grey
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextField(
                            controller: contactNumberText,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
