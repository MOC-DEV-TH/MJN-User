import 'package:MJN/views/InvoiceDetailView.dart';
import 'package:flutter/material.dart';
class SelectPaymentView extends StatefulWidget {
  @override
  _SelectPaymentViewState createState() => _SelectPaymentViewState();
}

class _SelectPaymentViewState extends State<SelectPaymentView> {

  int changePageIndex = 0;
  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  changePageIndex == 1 ? InvoiceDetailView() :SingleChildScrollView(
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

                  ],
                ),
              ),

            ),

          ],),
      ),
    );
  }
}
