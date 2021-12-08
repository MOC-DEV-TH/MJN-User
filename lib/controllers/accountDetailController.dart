import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/accountInfoVO.dart';
import 'package:get/state_manager.dart';

class AccountDetailController extends GetxController{

   late AccountInfoVo accountInfoVo ;
  var isLoading = true.obs;

  Future<void> fetchAccountInfoData(String token,String uid,String tenantID) async {
    try {
      isLoading(true);
      print(token);
      print(uid);
      print(tenantID);

      var res = await MjnAPI.fetchAccountInfoData(token,uid,tenantID);

      if (res != null) {
        accountInfoVo = res;
        print(accountInfoVo.status);
      }
    } finally {
      isLoading(false);
    }
  }

}
