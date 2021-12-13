import 'package:MJN/models/promotionAndofferVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class PromotionItems extends StatelessWidget {
  List<Offer> promotionImages;

  PromotionItems(this.promotionImages);
  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(
      height: MediaQuery.of(context).size.width * 0.7,//180.0,
      width: MediaQuery.of(context).size.width,
      child: Carousel(
        boxFit: BoxFit.fill,
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 6.0,
        dotIncreasedColor: Color(0xFFFFFFFF),
        dotBgColor: Colors.transparent,
        dotColor: Colors.grey,
        dotPosition: DotPosition.bottomCenter,
        dotVerticalPadding: 10.0,
        showIndicator: true,
        indicatorBgPadding: 7.0,
        images: promotionImages.map((imgData) =>
            NetworkImage(
                BASE_URL + imgData.imageMm
            )).toList(),
      ),
    ),);
  }
}
