import 'package:MJN/NewViews/NewCreateServiceTicketView.dart';
import 'package:flutter/material.dart';

class NewServiceComplainView extends StatefulWidget {
  @override
  _NewServiceComplainViewState createState() => _NewServiceComplainViewState();
}

class _NewServiceComplainViewState extends State<NewServiceComplainView> {
  final List<String> promotionNews = <String>[
    'Aby',
    'Aish',
    'Aby',
    'Aish',
    'Aish',
    'Aby',
    'Aish',
    'Aish',
    'Aby',
    'Aish',
    'Aby',
    'Aish'
        'Aby',
    'Aish',
  ];

  int changePageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return changePageIndex == 1
        ? NewCreateServiceTicketView()
        : Scaffold(
            backgroundColor: Color(0xff188FC5),
            body: SingleChildScrollView(
                child: Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        changePageIndex = 1;
                      });
                    },
                      child: Image(image: AssetImage('assets/images/create_service.png'))),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Your Service Ticket',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _buildServiceTicketTitle()
                ],
              ),
            )),
          );
  }

  Widget _buildServiceTicketTitle() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            color: Color(0xffffcc35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Text(
                    'Ticket ID',
                    style: TextStyle(color: Colors.black, fontSize: 8),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(
                    'Ticket\nCreated Date',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4, right: 20),
                  child: Container(
                    child: Text(
                      'Service\nRequest',
                      style: TextStyle(color: Colors.black, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4, right: 10),
                  child: Text(
                    'Issue',
                    style: TextStyle(color: Colors.black, fontSize: 8),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                    bottom: 4,
                  ),
                  child: Text(
                    'Status',
                    style: TextStyle(color: Colors.black, fontSize: 8),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: new NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return MyServiceTicketItems();
            },
            itemCount: promotionNews.length,
          )
        ],
      ),
    );
  }

  Widget MyServiceTicketItems() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  child: InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Text(
                      '240240',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  child: Text(
                    '12-12-2021',
                    style: TextStyle(color: Colors.black, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Technical',
                      style: TextStyle(color: Colors.black, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Slow Performance',
                    style: TextStyle(color: Colors.black, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(
                            24.0) //                 <--- border radius here
                        ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 4, bottom: 4, left: 6, right: 6),
                    child: Text(
                      'Received',
                      style: TextStyle(color: Colors.white, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
