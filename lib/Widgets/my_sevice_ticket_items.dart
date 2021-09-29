import 'package:flutter/material.dart';
class MyServiceTicketItems extends StatelessWidget {

  String ticketID,ticketCreateDate,issue,serviceRequest,status;
  MyServiceTicketItems(
      this.ticketID,this.ticketCreateDate,this.issue,this.serviceRequest,this.status
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 41,
            child: InkWell(
              onTap: (){},
              child: Text(
                ticketID,
                style: TextStyle(color: Colors.black, fontSize: 8,decoration: TextDecoration.underline,),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.black,
          ),

          Container(
            width: 50,
            child: Text(
              ticketCreateDate,
              style: TextStyle(color: Colors.black, fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.black,
          ),
          Container(
            width: 40,
            child: Text(
              serviceRequest,
              style: TextStyle(color: Colors.black, fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.black,
          ),
          Container(
            width: 30,
            child: Text(
              issue,
              style: TextStyle(color: Colors.black, fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.black,
          ),
          Container(
            width: 34,
            child: Text(
              status,
              style: TextStyle(color: Colors.black, fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),

        ],
      ),
    );
  }
}
