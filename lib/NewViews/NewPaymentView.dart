import 'package:MJN/NewViews/PaymentInvoiceView.dart';
import 'package:MJN/controllers/transactionListController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPaymentView extends StatefulWidget {
  @override
  _NewPaymentViewState createState() => _NewPaymentViewState();
}

class _NewPaymentViewState extends State<NewPaymentView> {
  final TransactionListController transactionListController =
      Get.put(TransactionListController());

  int changePageIndex = 0;
  int paymentStatusIndex = 0;

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String paymentStatus = paymentStatusIndex == 1 ? 'Unpaid' : paymentStatusIndex == 2 ? 'Paid' : '';
    return changePageIndex == 1 ? PaymentInvoiceView(paymentStatus) :Scaffold(
      backgroundColor: Color(0xff188FC5),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 25),
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Unpaid',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xffe9e9e9)),
                ),
              ),
              _buildPaymentStatusUnpaidTitle(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Paid',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xffe9e9e9)),
                ),
              ),
              _buildPaymentStatusPaidTitle()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentStatusUnpaidTitle() {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xffffcc35),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Invoice_id',
                    style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Start date',
                    style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'End date',
                    style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Amount',
                    style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: new NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 73,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    paymentStatusIndex = 1;
                                    changePageIndex = 1;
                                  });
                                },
                                child: Text(
                                  '12-3456778656',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 10,
                                      decoration: TextDecoration.underline),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              width: 63,
                              child: Text(
                                '2021-12-3',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 60,
                              child: Text(
                                '2021-1-1',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 56,
                              child: Text(
                                '52000',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: 4,
            ),


            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    'Total',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Text(
                    '100000',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ),
              ],),
            ),


          ],
        ));
  }

  Widget _buildPaymentStatusPaidTitle() {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xffffcc35),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Invoice_id',
                    style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Start date',
                    style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'End date',
                    style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Amount',
                    style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: new NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 73,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    paymentStatusIndex = 2;
                                    changePageIndex = 1;
                                  });
                                },
                                child: Text(
                                  '12-3456778656',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      decoration: TextDecoration.underline),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              width: 63,
                              child: Text(
                                '2021-12-3',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 60,
                              child: Text(
                                '2021-1-1',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 56,
                              child: Text(
                                '52000',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: 12,
            )
          ],
        ));
  }
}
