import 'package:MJN/views/ServiceComplainView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CreateServiceTicketView extends StatefulWidget {
  static const routeName = '/create_service_ticket';

  @override
  _CreateServiceTicketViewState createState() =>
      _CreateServiceTicketViewState();
}

class _CreateServiceTicketViewState extends State<CreateServiceTicketView> {
  var buildingText = TextEditingController();
  var unitText = TextEditingController();
  var emailText = TextEditingController();
  var phoneNoText = TextEditingController();
  var nameText = TextEditingController();
  var messageText = TextEditingController();

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
            body: GestureDetector(
              onTap: (){
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  changePageIndex = 1;
                                });
                              },
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(Icons.keyboard_backspace_sharp,size: 40,))),
                          Row(
                            children: [
                              Container(
                                width: 150,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Name',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Building',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Unit',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Email',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Phone Number',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          'Type of Service Request',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'Issue',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ]),
                              ),
                              Expanded(
                                child: Column(
                                  children: [

                                    SizedBox(
                                      height: 20,
                                    ),

                                Container(
                                  height: 40,
                                  decoration:
                                  BoxDecoration(border: Border.all(color: Colors.blueAccent),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      controller: nameText,
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
                                      BoxDecoration(border: Border.all(color: Colors.blueAccent),
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
                                      BoxDecoration(border: Border.all(color: Colors.blueAccent),
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
                                      BoxDecoration(border: Border.all(color: Colors.blueAccent),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 5),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: emailText,
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
                                      BoxDecoration(border: Border.all(color: Colors.blueAccent),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 5),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: phoneNoText,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 40,
                                    ),

                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight: MediaQuery.of(context).size.height,
                                        maxWidth: MediaQuery.of(context).size.width,
                                      ),
                                      child: Neumorphic(
                                        style: NeumorphicStyle(
                                          shape: NeumorphicShape.concave,
                                          boxShape: NeumorphicBoxShape.roundRect(
                                              BorderRadius.circular(12)),
                                          depth: -4,
                                          lightSource: LightSource.topLeft,
//                    color: Colors.grey
                                        ),
                                        child: DropdownButtonFormField<int>(
                                          onChanged: (value) {},
                                          items: [1, 2, 3, 4, 5]
                                              .map((label) => DropdownMenuItem(
                                            child:
                                            Text(label.toString()),
                                            value: label,
                                          ))
                                              .toList(),
                                          hint: Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Text(
                                              '-Select Service Request-',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 40,
                                    ),

                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight: MediaQuery.of(context).size.height,
                                        maxWidth: MediaQuery.of(context).size.width,
                                      ),
                                      child: Neumorphic(
                                        style: NeumorphicStyle(
                                          shape: NeumorphicShape.concave,
                                          boxShape: NeumorphicBoxShape.roundRect(
                                              BorderRadius.circular(12)),
                                          depth: -4,
                                          lightSource: LightSource.topLeft,
//                    color: Colors.grey
                                        ),
                                          child: DropdownButtonFormField<int>(
                                            onChanged: (value) {},
                                            items: [1, 2, 3, 4, 5]
                                                .map((label) => DropdownMenuItem(
                                              child:
                                              Text(label.toString()),
                                              value: label,
                                            ))
                                                .toList(),
                                            hint: Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: Text(
                                                '-Select Topic-',
                                                style: TextStyle(fontSize: 12),
                                          ),
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
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Message',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 80,
                            padding: EdgeInsets.only(left: 4,top: 4,right: 4),
                            decoration:
                            BoxDecoration(border: Border.all(color: Colors.blueAccent),
                            ),
                            child: TextField(
                              controller: messageText,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 200,
                            child: NeumorphicButton(
                              onPressed: () {},
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(18)),
                                color: Colors.amber,
                                depth: 0,
//                lightSource: LightSource.topLeft,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          );
  }
}
