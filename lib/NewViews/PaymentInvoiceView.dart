import 'package:MJN/NewViews/ChannelOnlinePaymentView.dart';
import 'package:MJN/NewViews/NewPaymentView.dart';
import 'package:MJN/NewViews/OnlinePaymentWebView.dart';
import 'package:MJN/controllers/getPaymentMethodController.dart';
import 'package:MJN/controllers/invoiceController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentInvoiceView extends StatefulWidget {
  String paymentStatus;
  String invoiceID;

  PaymentInvoiceView(this.paymentStatus, this.invoiceID);

  @override
  _PaymentInvoiceViewState createState() => _PaymentInvoiceViewState();
}

class _PaymentInvoiceViewState extends State<PaymentInvoiceView> {
  int changePageIndex = 0;

  final InvoiceController invoiceController = Get.put(InvoiceController());
  final GetPaymentMethodController getPaymentMethodController =
      Get.put(GetPaymentMethodController());
  final langStorage = GetStorage();

  late String paymentMethodLink;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();

    invoiceController.fetchInvoiceDataByID(
        langStorage.read(TOKEN),
        langStorage.read(UID),
        widget.invoiceID,
        langStorage.read(DATA_TENANT_ID));
  }

  @override
  Widget build(BuildContext context) {
    return TabScreens.onlinePaymentIndex > 2
        ? OnlinePaymentWebView(paymentMethodLink)
        : TabScreens.onlinePaymentIndex == 1
        ? NewPaymentView()
        : Scaffold(
            backgroundColor: Color(0xff188FC5),
            body: SingleChildScrollView(
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20.0),
                  child: _buildWidget()),
            ),
          );
  }

  Widget _buildWidget() {
    return Obx(() {
      if (invoiceController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Invoice',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xffe9e9e9)),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        _buildLabelText(),
                        _buildMiddleText(),
                        _buildNetworkDataText(),

                      ]),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Due',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Text(
                          '.....................',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          invoiceController.invoiceVo.details.totalDue,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () {
                      if (widget.paymentStatus == 'Unpaid') {
                        getPaymentMethodController
                            .fetchPaymentMethod(
                              langStorage.read(TOKEN),
                              langStorage.read(DATA_TENANT_ID),
                              widget.invoiceID,
                            )
                            .then((value) => {
                                  if (getPaymentMethodController
                                          .getPaymentMethodsVo!.status ==
                                      'Success')
                                    {
                                      Future.delayed(
                                          const Duration(milliseconds: 700),
                                          () {

                                              setState(() {
                                                changePageIndex = 1;
                                                TabScreens.onlinePaymentIndex =3;
                                                paymentMethodLink =
                                                    getPaymentMethodController
                                                        .getPaymentMethodsVo!
                                                        .details
                                                        .paymentLink;
                                              });


                                      })
                                    }
                                });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text((widget.paymentStatus == 'Unpaid')
                          ? 'Make Payment'
                          : 'Paid'),
                    ),
                    textColor: Color(0xffe9e9e9),
                    color: Color(0xffff5f1f),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: (){

                    setState(() {
                      TabScreens.onlinePaymentIndex =1;
                    });

                  },
                  child: Text(
                    'Statement',
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,
                  ),
                ),

              ],
            ));
      }
    });
  }

  Widget _buildMiddleText(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [



          Text(
            '.....................',
            style: TextStyle(color: Color(0xffe9e9e9),),
            textAlign: TextAlign.center,
          ),

          SizedBox(
            height: 15,
          ),


          Text(
            '.....................',
            style: TextStyle(color: Color(0xffe9e9e9)),
            textAlign: TextAlign.center,
          ),

          SizedBox(
            height: 10,
          ),

          Text(
            '.....................',
            style: TextStyle(color: Color(0xffe9e9e9)),
            textAlign: TextAlign.center,
          ),

          SizedBox(
            height: 10,
          ),

          Text(
            '.....................',
            style: TextStyle(color: Color(0xffe9e9e9)),
          ),

          SizedBox(
            height: 12,
          ),

          Text(
            '.....................',
            style: TextStyle(color: Color(0xffe9e9e9)),
          ),

          SizedBox(
            height: 9,
          ),

          Text(
            '.....................',
            style: TextStyle(color: Color(0xffe9e9e9)),
          ),

          SizedBox(
            height: 10,
          ),

          Text(
            '.....................',
            style: TextStyle(color: Color(0xffe9e9e9)),
          ),

          SizedBox(
            height: 15,
          ),

          Text(
            '.....................',
            style: TextStyle(color: Color(0xffe9e9e9)),
          ),

          SizedBox(
            height: 15,
          ),

          Text(
            '.....................',
            style: TextStyle(color: Color(0xffe9e9e9)),
          ),

          SizedBox(
            height: 15,
          ),

          Text(
            '.....................',
            style: TextStyle(color: Color(0xffe9e9e9)),
          ),

          SizedBox(
            height: 15,
          ),

          Text(
            '.....................',
            style: TextStyle(color: Color(0xffe9e9e9)),
          ),

          SizedBox(
            height: 10,
          ),


          Text(
            '.....................',
            style: TextStyle(color: Color(0xffe9e9e9)),
          ),


        ],
      ),
    );
  }



  Widget _buildNetworkDataText(){
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            invoiceController.invoiceVo.details.name,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 12, color: Color(0xffe9e9e9)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            invoiceController.invoiceVo.details.firstname,
            style: TextStyle(
                fontSize: 12, color: Color(0xffe9e9e9)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            invoiceController.invoiceVo.details.lastname,
            style: TextStyle(
                fontSize: 12, color: Color(0xffe9e9e9)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            invoiceController.invoiceVo.details.building,
            style: TextStyle(
                fontSize: 12, color: Color(0xffe9e9e9)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            invoiceController.invoiceVo.details.unit,
            style: TextStyle(
                fontSize: 12, color: Color(0xffe9e9e9)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            invoiceController.invoiceVo.details.startDate,
            style: TextStyle(
                fontSize: 12, color: Color(0xffe9e9e9)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            invoiceController.invoiceVo.details.endDate,
            style: TextStyle(
                fontSize: 12, color: Color(0xffe9e9e9)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            invoiceController
                .invoiceVo.details.transactionDate,
            style: TextStyle(
                fontSize: 12, color: Color(0xffe9e9e9)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            invoiceController.invoiceVo.details.invoiceId,
            style: TextStyle(
                fontSize: 12, color: Color(0xffe9e9e9)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            invoiceController.invoiceVo.details.creationDate,
            style: TextStyle(
                fontSize: 12, color: Color(0xffe9e9e9)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            invoiceController.invoiceVo.details.amount,
            style: TextStyle(
                fontSize: 12, color: Colors.black),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            invoiceController.invoiceVo.details.tax,
            style: TextStyle(
                fontSize: 12, color: Colors.black),
          ),
        ],
      );

  }

  Widget _buildLabelText(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account',
          style: TextStyle(
              fontSize: 12, color: Color(0xffe9e9e9)),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'First Name',
          style: TextStyle(
              fontSize: 12, color: Color(0xffe9e9e9)),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Last Name',
          style: TextStyle(
              fontSize: 12, color: Color(0xffe9e9e9)),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Building',
          style: TextStyle(
              fontSize: 12, color: Color(0xffe9e9e9)),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Unit',
          style: TextStyle(
              fontSize: 12, color: Color(0xffe9e9e9)),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Start date',
          style: TextStyle(
              fontSize: 12, color: Color(0xffe9e9e9)),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'End date',
          style: TextStyle(
              fontSize: 12, color: Color(0xffe9e9e9)),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Transaction date',
          style: TextStyle(
              fontSize: 12, color: Color(0xffe9e9e9)),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Invoice ID',
          style: TextStyle(
              fontSize: 12, color: Color(0xffe9e9e9)),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Invoice date',
          style: TextStyle(
              fontSize: 12, color: Color(0xffe9e9e9)),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Amount',
          style:
          TextStyle(fontSize: 12, color: Colors.black),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Tax',
          style:
          TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
    );
  }


}
