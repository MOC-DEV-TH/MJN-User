import 'package:MJN/Widgets/current_subscription_items.dart';
import 'package:MJN/views/AccountDetailView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int changePageIndex = 0;

  //test list
  final List<String> currentPlan = <String>['Aby', 'Aish', 'Ayan', 'Ben', 'Bob', 'Charlie', 'Cook', 'Carline'];
  final List<int> endDate = <int>[2, 0, 10, 6, 52, 4, 0, 2];
  final List<int> startDate = <int>[2, 0, 10, 6, 52, 4, 0, 2];

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return changePageIndex == 1
        ? AccountView()
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.blueAccent,
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 150,
                    child: Text(
                      'Promotion News',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: NeumorphicButton(
                      onPressed: () {
                        setState(() {
                          changePageIndex = 1;
                        });
                      },
                      child: Text(
                        "My Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(14)),
                        color: Colors.amber,
                        depth: 8,
//                lightSource: LightSource.topLeft,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 12),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Building',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Unit',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ':Mr.Test',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              ':A36',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              ':2021',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),


                      Container(
                        width: 136,
                          color: Colors.blueAccent,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6,bottom: 6,),
                            child: Text(
                              'currentSubscription'.tr,
                              style: TextStyle(color: Colors.black, fontSize: 12,),
                              textAlign: TextAlign.center,
                            ),
                          )),

                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                    Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(color: Colors.blueAccent),
                                borderRadius: BorderRadius.all(Radius.circular(
                                        8.0) //                 <--- border radius here
                                    ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
                                child: Text(
                                  'Start date',
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              )),
                        ),

                        Container(width: 1,height: 30,color: Colors.grey,),

                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(color: Colors.blueAccent),
                                borderRadius: BorderRadius.all(Radius.circular(
                                        8.0) //                 <--- border radius here
                                    ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
                                child: Text(
                                  'End date',
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              )),
                        ),

                        Container(width: 1,height: 30,color: Colors.grey,),

                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(color: Colors.blueAccent),
                                borderRadius: BorderRadius.all(Radius.circular(
                                        8.0) //                 <--- border radius here
                                    ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
                                child: Text(
                                  'Current Plan',
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              )),
                        ),
                      ],
                    ),
                    ),

                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (ctx,index){
                    return CurrentSubscriptionItems(startDate[index], endDate[index], currentPlan[index]);
                  },itemCount: startDate.length,)

                ],
              ),
            ),
          );
  }
}
