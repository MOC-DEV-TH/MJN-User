import 'package:MJN/views/ServiceComplainView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyServiceTicketView extends StatefulWidget {
  @override
  _MyServiceTicketViewState createState() => _MyServiceTicketViewState();
}

class _MyServiceTicketViewState extends State<MyServiceTicketView> {
  int changePageIndex = 0;

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return changePageIndex == 1
        ? ServiceComplainView()
        : Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            changePageIndex = 1;
                          });
                        },
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.arrow_back))),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 10, left: 10),
                      child: NeumorphicButton(
                        onPressed: () {},
                        child: Text(
                          "My Service Ticket",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(14)),
                          color: Colors.blue,
                          depth: 8,
//                lightSource: LightSource.topLeft,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
