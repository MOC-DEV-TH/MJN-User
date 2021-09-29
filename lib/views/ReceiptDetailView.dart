import 'package:MJN/views/PaymentView.dart';
import 'package:flutter/material.dart';
class ReceiptDetailView extends StatefulWidget {
  @override
  _ReceiptDetailViewState createState() => _ReceiptDetailViewState();
}

class _ReceiptDetailViewState extends State<ReceiptDetailView> {
  int changePageIndex = 0;
  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return changePageIndex == 1 ? PaymentView() :SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
          InkWell(
              onTap: () {
                setState(() {
                  changePageIndex = 1;
                });
              },
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.keyboard_backspace_sharp,
                    size: 40,
                  ))),

            SizedBox(height: 20,),

      Container(
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.only(left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child:
        Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 30),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [

                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Username'),
                      Text('Invoice No'),
                      Text('Package'),
                      Text('Start Date'),
                      Text('End Date'),
                      Text('Paid Date'),
                      Text('Amount'),
                      Text('5%'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(': Scdddeee'),
                    Text(': 23-344555'),
                    Text(': 10 Mbps'),
                    Text(': 24 Aug 21'),
                    Text(': 23 jun 10'),
                    Text(': 20 jan 12'),
                    Text(': 50000 MMK'),
                    Text(': 2500 MMK'),
                  ],),
                ),

              ],
              ),

              SizedBox(height: 20,),

              Container(
                margin: EdgeInsets.only(left: 50,right: 60),
                height: 1,width: MediaQuery.of(context).size.width,color: Colors.grey,),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Text('Total Due'),
                ),
                Text(': 52,500 MMk'),
              ],),

              SizedBox(height: 30,),

          Container(
            alignment: Alignment.center,
            height: 60,
            margin: EdgeInsets.only(left: 20,right: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Text('Thank you for your payment!!',textAlign: TextAlign.center,) ),

            ],
          ),
        ),

      ),

        ],),
      ),
    );
  }
}
