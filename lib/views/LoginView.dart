import 'package:MJN/Widgets/login_main_drawer.dart';
import 'package:MJN/views/SignUpView.dart';
import 'package:MJN/views/tabView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailText = TextEditingController();
  var passwordText = TextEditingController();

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedLang = 'ENG';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Theme.of(context).primaryColorDark,
        actions: [
          Container(
            height: 50,
            width: 80,
            margin: EdgeInsets.only(bottom: 37, right: 30, top: 33),
            padding: EdgeInsets.all(2),
            child: Neumorphic(
              style: NeumorphicStyle(
                  color: Colors.white,
                  shape: NeumorphicShape.concave,
                  boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: -4,
                  lightSource: LightSource.topLeft),
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
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10, bottom: 12)),
              ),
            ),
          ),
        ],
      ),
      drawer: LoginMainDrawer(),
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 80,
            ),
            FlutterLogo(
              size: 100,
            ),
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
                controller: emailText,
                decoration: InputDecoration(
                    hintText: "Enter Email",
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
                controller: passwordText,
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10)),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.only(left: 130, right: 130),
              child: NeumorphicButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(TabScreens.routeName);
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      "Login",
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
            SizedBox(
              height: 40,
            ),

            InkWell(
              onTap: (){},
                child: Center(child: Text('Forget Password ?'))),

        SizedBox(
        height: 30,
      ),

            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return SignUpView();
                }));
              },
                  child: Container(
                    alignment: Alignment.center,
                       width:  MediaQuery.of(context).size.width,
                      child: Text('Sign Up'))) ,
          ],
        ),
      ),
    );
  }
}
