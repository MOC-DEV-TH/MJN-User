import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/Network/Request/RequestCreateTicket.dart';
import 'package:MJN/models/NetworkResultVO.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/views/ServiceComplainView.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class CreateTicketController extends GetxController{
  late NetworkResult networkResult;
  var isLoading = false.obs;
  void createTicket(RequestCreateTicket requestCreateTicket,String token,BuildContext context) async {
    try {
      isLoading(true);
      print(requestCreateTicket.name);
      print(token);


      var res = await MjnAPI.createTicket(requestCreateTicket,token);

      if (res != null) {
        networkResult = res;
        if(networkResult.status == 'Success'){
          AppUtils.showSuccessSnackBar('Success!!', 'Success create ticket!!');
          Future.delayed(const Duration(milliseconds: 700), () {
            Navigator.of(context).pushReplacementNamed(TabScreens.routeName);
          });

        }
        print(networkResult.status);
        print(networkResult.description);
      }
    } finally {
      isLoading(false);

    }
  }

}