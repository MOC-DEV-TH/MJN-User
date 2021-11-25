import 'package:flutter/material.dart';

class ProductAndServiceItems extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(children: [
        Expanded(
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 34),
                child: Image(
                  height: 300,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/package_three.png')),
              )
            ),

            Positioned(
              child:   Image(
                  image: AssetImage('assets/images/offer.png')),)

          ],),
        ),




      ],),
    );
  }
}
