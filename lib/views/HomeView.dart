import 'package:MJN/views/AccountView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeView extends StatefulWidget {

  static const routeName = '/home_screen';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int changePageIndex = 0;


  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return changePageIndex == 1 ? AccountView() :Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                  color: Colors.amber,
                  depth: 8,
//                lightSource: LightSource.topLeft,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8,left: 12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                      SizedBox(
                        height: 6,
                      ),
                      Text('Building',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                      SizedBox(
                        height: 6,
                      ),
                      Text('Unit',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                    ],
                  ),


                  SizedBox(
                    width: 20,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(':Mr.Test',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                      SizedBox(
                        height: 6,
                      ),
                      Text(':A36',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                      SizedBox(
                        height: 6,
                      ),
                      Text(':2021',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




