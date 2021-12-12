import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/promotionAndofferVO.dart';
import 'package:MJN/models/transactionVO.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController{

  PromotionAndOfferVo? promotionAndOfferVo;
  var isLoading = true.obs;

  void fetchPromotionAndOfferData(String tenantID,String token) async {
    try {
      isLoading(true);

      if((tenantID !=null && token !=null) && (tenantID.isNotEmpty && token.isNotEmpty))
      {
        var res = await MjnAPI.fetchPromotionAndOfferData(tenantID,token);

        if (res != null) {
          promotionAndOfferVo = res;
          print(promotionAndOfferVo!.status);
          isLoading(false);
        }
        else{
          isLoading(false);
        }
      }
      else{
        isLoading(false);
        promotionAndOfferVo = null;
      }
    } finally {
      //isLoading(false);
    }
  }

}