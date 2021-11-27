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
      body: Container(
          child: Column(
                children: [
                  Expanded(
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 55,bottom: 40),
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Color(0xffC0C0C0),
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                      ),

                      Positioned(child: Image(
                          width: double.infinity,
                          image: AssetImage('assets/images/about_us.png')))

                    ],),
                  )

                ],
              ),
        ),
    );
  }
}
