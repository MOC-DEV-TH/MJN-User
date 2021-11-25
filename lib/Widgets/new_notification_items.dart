import 'package:flutter/material.dart';

class NewNotificationItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(12),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Image(image: AssetImage('assets/images/outage_icon.png')),

        Container(height: 40,width: 2,color: Colors.grey,),

        Column(children: [
          Text('13 Oct 2021',style: TextStyle(fontSize: 8,color: Colors.grey),),

          Text('Outage on 20 Oct 2021',style: TextStyle(fontSize: 14,color: Colors.black),),

        ],)

      ],),
    );
  }
}
