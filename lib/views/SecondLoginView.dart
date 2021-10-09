import 'package:flutter/material.dart';

class SecondLoginView extends StatefulWidget {
  @override
  _SecondLoginViewState createState() => _SecondLoginViewState();
}

class _SecondLoginViewState extends State<SecondLoginView> {

  var buildingText = TextEditingController();
  var unitText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text('Select your individual unit'),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 50,right: 50),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(
                      12.0) //                 <--- border radius here
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Building'),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: EdgeInsets.only(bottom: 6),
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.all(Radius.circular(
                              12.0) //                 <--- border radius here
                          ),
                        ),
                        child: TextField(
                            textAlign: TextAlign.center,
                            controller: buildingText,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Unit'),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.only(bottom: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.all(Radius.circular(
                              12.0) //                 <--- border radius here
                          ),
                        ),
                        child: TextField(
                            controller: unitText,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
