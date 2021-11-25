import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class PromotionItems extends StatelessWidget {
  List<String> images;

  PromotionItems(this.images);
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
        images: images.map((imgData) =>
            AssetImage('assets/images/promo_item.png'),).toList(),
      ),
    ),);
  }
}
