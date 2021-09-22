import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';



class PaymentView extends StatefulWidget {

  static const routeName = '/payment_screen';

  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {

  List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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

        ],
      ),
    );
  }
}
