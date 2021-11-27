import 'package:flutter/material.dart';
class PaymentInvoiceView extends StatefulWidget {

  String paymentStatus;
  PaymentInvoiceView(this.paymentStatus);


  @override
  _PaymentInvoiceViewState createState() => _PaymentInvoiceViewState();
}

class _PaymentInvoiceViewState extends State<PaymentInvoiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff188FC5),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30.0),
          child: _buildWidget()
        ),
      ),
    );
  }

  Widget _buildWidget(){
    return Column(children: [
      Text(
        'Invoice',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Color(0xffe9e9e9)),
      ),

      SizedBox(height: 30,),

      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Account',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),


            Text(
              '.............................',
              style: TextStyle(
                  color: Color(0xffe9e9e9)),
            ),


            Text(
              'XXXXXX',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),

          ],),
      ),

      SizedBox(height: 15,),

      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'First Name',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),


            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: Text(
                '.............................',
                style: TextStyle(
                    color: Color(0xffe9e9e9)),
              ),
            ),


            Text(
              'XXXXXX',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),

          ],),
      ),

      SizedBox(height: 15,),

      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Last Name',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),


            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Text(
                '.............................',
                style: TextStyle(
                    color: Color(0xffe9e9e9)),
              ),
            ),


            Text(
              'XXXXXX',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),

          ],),
      ),

      SizedBox(height: 15,),

      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Building',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),


            Text(
              '.............................',
              style: TextStyle(
                  color: Color(0xffe9e9e9)),
            ),


            Text(
              'XXXXXX',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),

          ],),
      ),


      SizedBox(height: 15,),

      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Unit',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                '.............................',
                style: TextStyle(
                    color: Color(0xffe9e9e9)),
              ),
            ),


            Text(
              'XXXXXX',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),

          ],),
      ),


      SizedBox(height: 15,),

      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Start date',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),


            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                '.............................',
                style: TextStyle(
                    color: Color(0xffe9e9e9)),
              ),
            ),


            Text(
              'XXXXXX',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),

          ],),
      ),


      SizedBox(height: 15,),

      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'End date',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),


            Padding(
              padding: const EdgeInsets.only(right: 3),
              child: Text(
                '.............................',
                style: TextStyle(
                    color: Color(0xffe9e9e9)),
              ),
            ),


            Text(
              'XXXXXX',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),

          ],),
      ),


      SizedBox(height: 15,),

      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transaction date',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),


            Padding(
              padding: const EdgeInsets.only(right: 52),
              child: Text(
                '.............................',
                style: TextStyle(
                    color: Color(0xffe9e9e9)),
              ),
            ),


            Text(
              'XXXXXX',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),

          ],),
      ),


      SizedBox(height: 15,),

      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Invoice ID',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),


            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Text(
                '.............................',
                style: TextStyle(
                    color: Color(0xffe9e9e9)),
              ),
            ),


            Text(
              'XXXXXX',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),

          ],),
      ),


      SizedBox(height: 15,),

      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Invoice date',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),


            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                '.............................',
                style: TextStyle(
                    color: Color(0xffe9e9e9)),
              ),
            ),


            Text(
              'XXXXXX',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffe9e9e9)),
            ),

          ],),
      ),


      SizedBox(height: 15,),

      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Amount',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                '.............................',
                style: TextStyle(
                    color: Colors.black),
              ),
            ),


            Text(
              'XXXXXX',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),
            ),

          ],),
      ),


      SizedBox(height: 15,),

      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                '.............................',
                style: TextStyle(
                    color: Colors.black),
              ),
            ),


            Text(
              'XXXXXX',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),
            ),

          ],),
      ),

      SizedBox(height: 15,),

      Container(height: 1,width: MediaQuery.of(context).size.width,color: Colors.grey,),


      SizedBox(height: 15,),

      Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Due',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),
            ),


            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Text(
                '.............................',
                style: TextStyle(
                    color: Colors.black),
              ),
            ),


            Text(
              'XXXXXX',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),
            ),

          ],),
      ),

      SizedBox(height: 35,),

      Container(
        width: 110,
        child: RaisedButton(onPressed: (){
          setState(() {

          });
        },
          child: Text((widget.paymentStatus == 'Unpaid')?'Unpaid' : 'Paid'),
          textColor: Color(0xffe9e9e9),
          color: Color(0xffff5f1f),
        ),
      ),

      SizedBox(height: 10,),

      Text(
        'Statement',
        style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline),
        textAlign: TextAlign.center,
      ),

    ],);
}

}
