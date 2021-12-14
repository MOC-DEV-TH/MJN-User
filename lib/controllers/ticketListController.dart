import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/ticketListVO.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class TicketListController extends GetxController{

  TicketListVo? ticketListVo;
  var isLoading = true.obs;

  void fetchTicketList(String token,String uid,String tenantID,BuildContext context) async {
    try {
      isLoading(true);
      print(token);
      print(uid);
      print(tenantID);

      var res = await MjnAPI.fetchTicketList(token,uid,tenantID);


      if (res != null) {
        ticketListVo = res;
        print(ticketListVo!.status);
        isLoading (false);

        if(ticketListVo!.status == 'Fail'){
          AppUtils.showSessionExpireDialog('Session is expired', 'Please login again',context);
        }
      }
      else {
        isLoading(false);
      }

    } finally {
      //isLoading(false);
    }
  }

}