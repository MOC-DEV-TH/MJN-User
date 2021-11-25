import 'package:MJN/Widgets/productAndServiceItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NewProductAndServiceView extends StatefulWidget {
  @override
  _NewProductAndServiceViewState createState() => _NewProductAndServiceViewState();
}

class _NewProductAndServiceViewState extends State<NewProductAndServiceView> {

  final List<int> imgList = <int>[2, 0, 10, 6, 6, 6];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff188FC5),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GridView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  children: imgList
                      .map((imgData) => ProductAndServiceItems())
                      .toList(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    childAspectRatio: (2/2),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text('Interest?',style: TextStyle(color: Colors.black,fontSize: 16),),
                ),

                Container(
                  width: 150,
                  height: 40,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 27),
                  child: NeumorphicButton(
                    onPressed: () {},
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8)),
                      color: Colors.deepOrangeAccent,
                      depth: -8,
//                lightSource: LightSource.topLeft,
                    ),
                  ),
                ),

              ],),
            )
        ],),
      ),
    );
  }
}
