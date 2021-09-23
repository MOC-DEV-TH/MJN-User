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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
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
                    backgroundColor: invoice ?  Colors.amber : Colors.grey,
                    padding: EdgeInsets.only(left: 50, right: 50),
                    label: Text(
                        'Invoice',
                        style: TextStyle(fontSize:  14,color: Colors.black )
                    ),
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
                    backgroundColor: receipt ?  Colors.amber : Colors.grey,
                    padding: EdgeInsets.only(left: 50, right: 50),
                    label: Text(
                        'Receipt',
                        style: TextStyle(fontSize:  14,color: Colors.black )
                    ),
                    onPressed: () {
                      setState(() {
                         invoice = false;
                         receipt = true;
                      });
                    }),
              ),

            ],)

          ],
        ),
      ),
    );
  }
}
