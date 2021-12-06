import 'package:MJN/NewViews/NewPaymentView.dart';
import 'package:flutter/material.dart';

class OnlinePaymentView extends StatefulWidget {
  @override
  _OnlinePaymentViewState createState() => _OnlinePaymentViewState();
}

class _OnlinePaymentViewState extends State<OnlinePaymentView> {
  var buildTextController = TextEditingController();
  var unitTextController = TextEditingController();
  var contactNumberController = TextEditingController();

  int changePageIndex = 0;

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return changePageIndex == 1 ? NewPaymentView() : Scaffold(
      backgroundColor: Color(0xff188FC5),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image(
                      image: AssetImage('assets/images/online_payment_icon.png')),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffe9e9e9),
                    border: Border.all(color: Color(0xffe9e9e9)),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 55),
                          child: Row(
                            children: [
                              Text('Building : ',
                                  style: TextStyle(color: Colors.grey)),
                              Expanded(
                                child: TextField(
                                    controller: buildTextController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "xxx",
                                        hintStyle: TextStyle(color: Colors.grey)
                                    ),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 55),
                          child: Row(
                            children: [
                              Text(
                                'Unit : ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: unitTextController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "xxx",
                                      hintStyle: TextStyle(color: Colors.grey)),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30,),

                Row(children: [
                  Text(
                    'Contact Number:',
                    style: TextStyle(
                        fontSize: 14, color: Color(0xffe9e9e9)),
                  ),

                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 50),
                      decoration: BoxDecoration(
                        color: Color(0xffe9e9e9),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: contactNumberController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],),

                SizedBox(height: 60,),

                Container(
                  width: 110,
                  child: RaisedButton(onPressed: (){
                    setState(() {
                         changePageIndex = 1;
                    });
                  },
                    child: Text('Next'),
                    textColor: Color(0xffe9e9e9),
                    color: Color(0xffff5f1f),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
