import 'package:MJN/views/InvoiceDetailView.dart';
import 'package:MJN/views/ReceiptDetailView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PaymentView extends StatefulWidget {
  static const routeName = '/payment_screen';

  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  var invoice = false;
  var receipt = false;
  int changePageIndex = 0;

  final List<String> endDate = <String>[
    '19/8/21',
    '19/8/21',
    '19/8/21',
    '19/8/21',
  ];
  final List<String> startDate = <String>[
    '19/8/21',
    '19/8/21',
    '19/8/21',
    '19/8/21',
  ];
  final List<int> amount = <int>[
    2000,
    4000,
    5667,
    4556,
  ];
  final List<String> transactionId = <String>[
    '234551',
    '234551',
    '234551',
    '234551',
  ];
  final List<String> status = <String>[
    'Unpaid',
    'Unpaid',
    'Pain',
    'Paid',
  ];

  @override
  void initState() {
    super.initState();
    invoice = false;
    receipt = false;
    changePageIndex = 0;
  }

  @override
  void didChangeDependencies() {
    invoice = false;
    receipt = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return changePageIndex == 1
        ? ReceiptDetailView()
        : changePageIndex == 2
            ? InvoiceDetailView()
            : Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: NeumorphicButton(
                          onPressed: () {},
                          child: Text(
                            "Payment",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(14)),
                            color: Colors.blue,
                            depth: 8,
//                lightSource: LightSource.topLeft,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ActionChip(
                                backgroundColor:
                                    invoice ? Colors.amber : Colors.grey,
                                padding: EdgeInsets.only(left: 50, right: 50),
                                label: Text('Invoice',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                onPressed: () {
                                  setState(() {
                                    invoice = true;
                                    receipt = false;
                                  });
                                }),
                          ),
                          Container(
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ActionChip(
                                backgroundColor:
                                    receipt ? Colors.amber : Colors.grey,
                                padding: EdgeInsets.only(left: 50, right: 50),
                                label: Text('Receipt',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                onPressed: () {
                                  setState(() {
                                    invoice = false;
                                    receipt = true;
                                  });
                                }),
                          ),
                        ],
                      ),
                      paymentItemLists(),
                    ],
                  ),
                ),
              );
  }

  Widget paymentItemLists() {
    return receipt
        ? Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Transaction\nID',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.grey,
                      ),
                      Text(
                        'Start date',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.grey,
                      ),
                      Text(
                        'End date',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.grey,
                      ),
                      Text(
                        'Amount',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 70,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      changePageIndex = 1;
                                    });
                                  },
                                  child: Text(
                                    transactionId[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        decoration: TextDecoration.underline),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 30,
                                color: Colors.grey,
                              ),
                              Container(
                                width: 63,
                                child: Text(
                                  startDate[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 30,
                                color: Colors.grey,
                              ),
                              Container(
                                width: 55,
                                child: Text(
                                  endDate[index],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 30,
                                color: Colors.grey,
                              ),
                              Container(
                                width: 55,
                                child: Text(
                                  amount[index].toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: transactionId.length,
                )
              ],
            ),
          )
        : invoice
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Text(
                              'Invoice ID',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            color: Colors.grey,
                          ),
                          Text(
                            'Start date',
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            color: Colors.grey,
                          ),
                          Text(
                            'End date',
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              'Amount',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Text(
                              'Status',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 63,
                                    child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          changePageIndex = 2;
                                        });
                                      },
                                      child: Text(
                                        transactionId[index],
                                        style: TextStyle(
                                            color: status[index] == 'Unpaid'
                                                ? Color(0xffff0000)
                                                : Color(0xff000000),
                                            fontSize: 10,
                                            decoration: TextDecoration.underline),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 30,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    width: 63,
                                    child: Text(
                                      startDate[index],
                                      style: TextStyle(
                                        color: status[index] == 'Unpaid'
                                            ? Color(0xffff0000)
                                            : Color(0xff000000),
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 30,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    width: 55,
                                    child: Text(
                                      endDate[index],
                                      style: TextStyle(
                                          color: status[index] == 'Unpaid'
                                              ? Color(0xffff0000)
                                              : Color(0xff000000),
                                          fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 30,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    width: 55,
                                    child: Text(
                                      amount[index].toString(),
                                      style: TextStyle(
                                          color: status[index] == 'Unpaid'
                                              ? Color(0xffff0000)
                                              : Color(0xff000000),
                                          fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 30,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    width: 55,
                                    child: Text(
                                      status[index],
                                      style: TextStyle(
                                          color: status[index] == 'Unpaid'
                                              ? Color(0xffff0000)
                                              : Color(0xff000000),
                                          fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: transactionId.length,
                    )
                  ],
                ),
              )
            : Container();
  }
}
