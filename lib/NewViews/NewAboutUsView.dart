import 'package:flutter/material.dart';

class NewAboutUsView extends StatefulWidget {
  @override
  _NewAboutUsViewState createState() => _NewAboutUsViewState();
}

class _NewAboutUsViewState extends State<NewAboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff188FC5),
      body:
         Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
               Container(
                   child: Image(image: AssetImage('assets/images/about_us.png'))),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 20,),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),),
              )
            ],
          ),
        ),
    );
  }
}
