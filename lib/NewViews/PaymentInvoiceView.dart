import 'package:MJN/NewViews/ChannelOnlinePaymentView.dart';
import 'package:MJN/NewViews/OnlinePaymentWebView.dart';
import 'package:MJN/controllers/getPaymentMethodController.dart';
import 'package:MJN/controllers/invoiceController.dart';
import 'package:MJN/utils/app_constants.dart';
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
    return changePageIndex == 1
        ? OnlinePaymentWebView(paymentMethodLink)
        : Scaffold(
      backgroundColor: Color(0xff188FC5),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30.0),
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account',
                      style: TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Text(
                        '.....................',
                        style: TextStyle(color: Color(0xffe9e9e9)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        invoiceController.invoiceVo.details.name,
                        textAlign: TextAlign.left,
                        style:
                        TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                      ),
                    ),
                  ],
                ),
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
                      'First Name',
                      style: TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 54),
                      child: Text(
                        '.....................',
                        style: TextStyle(color: Color(0xffe9e9e9)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        invoiceController.invoiceVo.details.firstname,
                        style:
                        TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                      ),
                    ),
                  ],
                ),
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
                      'Last Name',
                      style: TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 55),
                      child: Text(
                        '.....................',
                        style: TextStyle(color: Color(0xffe9e9e9)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        invoiceController.invoiceVo.details.lastname,
                        style:
                        TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                      ),
                    ),
                  ],
                ),
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
                      'Building',
                      style: TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Text(
                        '.....................',
                        style: TextStyle(color: Color(0xffe9e9e9)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        invoiceController.invoiceVo.details.building,
                        style:
                        TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                      ),
                    ),
                  ],
                ),
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
                      'Unit',
                      style: TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Text(
                        '.....................',
                        style: TextStyle(color: Color(0xffe9e9e9)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        invoiceController.invoiceVo.details.unit,
                        style:
                        TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                      ),
                    ),
                  ],
                ),
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
                      'Start date',
                      style: TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        '.....................',
                        style: TextStyle(color: Color(0xffe9e9e9)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        invoiceController.invoiceVo.details.startDate,
                        style:
                        TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                      ),
                    ),
                  ],
                ),
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
                      'End date',
                      style: TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Text(
                        '.....................',
                        style: TextStyle(color: Color(0xffe9e9e9)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        invoiceController.invoiceVo.details.endDate,
                        style:
                        TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                      ),
                    ),
                  ],
                ),
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
                      'Transaction date',
                      style: TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        '.....................',
                        style: TextStyle(color: Color(0xffe9e9e9)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        invoiceController.invoiceVo.details.transactionDate,
                        style:
                        TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                      ),
                    ),
                  ],
                ),
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
                      'Invoice ID',
                      style: TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 58),
                      child: Text(
                        '.....................',
                        style: TextStyle(color: Color(0xffe9e9e9)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        invoiceController.invoiceVo.details.invoiceId,
                        style:
                        TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                      ),
                    ),
                  ],
                ),
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
                      'Invoice date',
                      style: TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 47),
                      child: Text(
                        '.....................',
                        style: TextStyle(color: Color(0xffe9e9e9)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        invoiceController.invoiceVo.details.creationDate,
                        style:
                        TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                      ),
                    ),
                  ],
                ),
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
                      'Amount',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Text(
                        '.....................',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        invoiceController.invoiceVo.details.amount,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ],
                ),
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
                      'Tax',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 92),
                      child: Text(
                        '.....................',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        invoiceController.invoiceVo.details.tax,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 1,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
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
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        '.....................',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
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
                      getPaymentMethodController.fetchPaymentMethod(
                        langStorage.read(TOKEN),
                        langStorage.read(DATA_TENANT_ID),
                        widget.invoiceID,
                      ).then((value) => {

                      if (getPaymentMethodController
                          .getPaymentMethodsVo!.status ==
                      'Success') {
                          Future.delayed(const Duration(milliseconds: 700), () {
                    setState(() {
                    changePageIndex = 1;
                    paymentMethodLink =
                    getPaymentMethodController.getPaymentMethodsVo!
                        .details.paymentLink;
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
              Text(
                'Statement',
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.underline),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }
    });
  }
}
