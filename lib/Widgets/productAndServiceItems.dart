import 'package:MJN/models/promotionAndofferVO.dart';
import 'package:flutter/material.dart';

class ProductAndServiceItems extends StatelessWidget {
  Offer offerImages;
  ProductAndServiceItems(this.offerImages);
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
                child: Image.network(
                  offerImages.link + offerImages.imageMm,
                  height: 60,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
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
