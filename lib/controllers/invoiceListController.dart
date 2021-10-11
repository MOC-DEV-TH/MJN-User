import 'package:MJN/Network/MjnAPI.dart';
import 'package:MJN/models/invoiceListVO.dart';
import 'package:get/state_manager.dart';


class InvoiceListController extends GetxController{
  InvoiceListVo invoiceListVo;
  var isLoading = true.obs;

  void fetchPaymentInvoiceList(String token,String uid,String tenantID) async {
    try {
      isLoading(true);
      print(token);
      print(uid);
      print(tenantID);

      var res = await MjnAPI.fetchPaymentInvoiceList(token,uid,tenantID);


      if (res != null) {
        invoiceListVo = res;
        print(invoiceListVo.status);
      }
    } finally {
      isLoading(false);
    }
  }

}