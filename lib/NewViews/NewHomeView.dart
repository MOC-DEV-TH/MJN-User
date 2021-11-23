import 'package:MJN/Widgets/current_subscription_items.dart';
import 'package:MJN/Widgets/package_and_service_items.dart';
import 'package:MJN/Widgets/promotion_items.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/AccountDetailView.dart';
import 'package:MJN/views/PackagePlanDetailView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NewHomeView extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _NewHomeViewState createState() => _NewHomeViewState();
}

class _NewHomeViewState extends State<NewHomeView> {
  int changePageIndex = 0;


  final List<int> imgList = <int>[2, 0, 10, 6, 6, 6];
  final List<String> promotionNews = <String>[
    'Aby',
    'Aish',
    'Aby',
    'Aish',
  ];
  final loginDataStorage = GetStorage();
  double itemHeight = 0;
  double itemWidth = 0;

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    itemHeight = (size.height - kToolbarHeight - 24) / 4;
    itemWidth = size.width / 2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: Colors.blueAccent,
                width: double.infinity,
                alignment: Alignment.center,
                height: 200,
                child: PromotionItems(promotionNews)),

            Container(
              color:  Color(0xff188FC5),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text(
                    "Package Plan & Other Service",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),

                  SizedBox(height: 10,),

              GridView(
                        shrinkWrap: true,
                        physics: new NeverScrollableScrollPhysics(),
                        primary: false,
                        padding: const EdgeInsets.all(10),
                        children:
                        imgList.map((imgData) => PackageAndServiceItems()).toList(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: (1 / .8),
                        )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget PackageAndServiceItems() {
    return InkWell(
      onTap: () {
        setState(() {
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffBC8F8F)),
          borderRadius: BorderRadius.all(
              Radius.circular(24.0) //                 <--- border radius here
              ),
        ),
      ),
    );
  }
}
