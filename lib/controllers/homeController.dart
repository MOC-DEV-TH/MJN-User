import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/promotionAndofferVO.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController{

  PromotionAndOfferVo? promotionAndOfferVo;
  var isLoading = true.obs;

  void fetchPromotionAndOfferData(BuildContext context) async {
    try {
      isLoading(true);

        var res = await MjnAPI.fetchPromotionAndOfferData();

        if (res != null) {

            promotionAndOfferVo = res;
            print(promotionAndOfferVo!.status);
            isLoading(false);
        }
        else{
          isLoading(false);
        }

    } finally {
      isLoading(false);
    }
  }

}