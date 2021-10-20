import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/Network/Request/RequestCreateTicket.dart';
import 'package:MJN/models/NetworkResultVO.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:get/state_manager.dart';

class CreateTicketController extends GetxController{
  NetworkResult networkResult;
  var isLoading = false.obs;
  void createTicket(RequestCreateTicket requestCreateTicket,String token) async {
    try {
      isLoading(true);
      print(requestCreateTicket.name);
      print(token);


      var res = await MjnAPI.createTicket(requestCreateTicket,token);

      if (res != null) {
        networkResult = res;
        if(networkResult.status == 'Success'){
          AppUtils.showSuccessSnackBar('Success!!', 'Success create ticket!!');
        }
        print(networkResult.status);
        print(networkResult.description);
      }
    } finally {
      isLoading(false);
    }
  }

}