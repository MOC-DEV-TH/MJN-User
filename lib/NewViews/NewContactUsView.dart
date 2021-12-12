import 'package:MJN/controllers/homeController.dart';
import 'package:MJN/models/promotionAndofferVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class NewContactUsView extends StatefulWidget {
  @override
  _NewContactUsViewState createState() => _NewContactUsViewState();
}

class _NewContactUsViewState extends State<NewContactUsView> {

  final HomeController homeController = Get.put(HomeController());
  final loginDataStorage = GetStorage();

  @override
  void initState() {
    super.initState();
    homeController.fetchPromotionAndOfferData(
      loginDataStorage.read(DATA_TENANT_ID),loginDataStorage.read(TOKEN),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff188FC5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20,top: 20),
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image(image: AssetImage('assets/images/contact_us.png')),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30,right: 20),
                    child: Column(
                      children: [
                        Text(
                          '24/7 Hotline Number :',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.normal),
                        ),

                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Icon(Icons.phone,color: Colors.white,),
                            InkWell(
                              onTap: (){
                                launch(('tel://01-4709977'));
                              },
                              child: Text(
                                '01-4709977',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 80,),

                        Text(
                          'Visit to us online :',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.normal),
                        ),

                        SizedBox(height: 10,),

                        Row(
                          children: [

                            Image(image: AssetImage('assets/images/email.png')),

                            SizedBox(width: 25,),

                            Image(image: AssetImage('assets/images/web_icon.png')),

                            SizedBox(width: 25,),

                            Image(image: AssetImage('assets/images/fb_icon.png')),

                          ],
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xff188FC5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Package Plan & Other Service",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    Obx((){
                      if(homeController.isLoading.value){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      else {
                        return
                          GridView(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              primary: false,
                              padding: const EdgeInsets.all(10),
                              scrollDirection: Axis.vertical,
                              children:  homeController.promotionAndOfferVo!.details.offer
                                  .map((imgData) =>
                                  PackageAndServiceItems(
                                      imgData))
                                  .toList(),
                              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: (1 / .8),
                              ));
                      }
                    })
                    ],
                  ),
                )
              ],
            ),
            

          ],
        ),
      ),
    );
  }

  Widget PackageAndServiceItems(Offer offer) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffBC8F8F)),
          borderRadius: BorderRadius.all(
              Radius.circular(24.0) //                 <--- border radius here
          ),
        ),
        child: Container(child: Image.network(
          offer.link + offer.imageMm,
          height: 60,
          width: double.infinity,
          fit: BoxFit.fitHeight,
        ),),
      ),
    );
  }
}
