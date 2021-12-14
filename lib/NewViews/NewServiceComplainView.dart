import 'package:MJN/NewViews/NewCreateServiceTicketView.dart';
import 'package:MJN/controllers/ticketListController.dart';
import 'package:MJN/models/ticketListVO.dart';
import 'package:MJN/models/ticketVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NewServiceComplainView extends StatefulWidget {
  @override
  _NewServiceComplainViewState createState() => _NewServiceComplainViewState();
}

class _NewServiceComplainViewState extends State<NewServiceComplainView> {

  final TicketListController ticketListController =
      Get.put(TicketListController());
  final loginDataStorage = GetStorage();

  int changePageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ticketListController.fetchTicketList(loginDataStorage.read(TOKEN),
        loginDataStorage.read(UID), loginDataStorage.read(DATA_TENANT_ID),context);

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
                      onTap: () {
                        setState(() {
                          changePageIndex = 1;
                        });
                      },
                      child: Image(
                          image:
                              AssetImage('assets/images/create_service.png'))),
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
    return

      Obx(() {
      if (ticketListController.isLoading.value) {
        return Container(
          child: CircularProgressIndicator(),
        );
      } else {
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
                      padding:
                          const EdgeInsets.only(top: 4, bottom: 4, right: 30),
                      child: Container(
                        child: Text(
                          'Service\nRequest',
                          style: TextStyle(color: Colors.black, fontSize: 8),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 4, bottom: 4, right: 10),
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
                  return MyServiceTicketItems(
                      ticketListController.ticketListVo!.details![index]);
                },
                itemCount: ticketListController.ticketListVo!.details!.length,
              )
            ],
          ),
        );
      }
    });
  }

  Widget MyServiceTicketItems(TicketDetail ticketVo) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:10,top: 10, bottom: 10),
            child: Container(
              margin: EdgeInsets.only(left: 30,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Text(
                        ticketVo.ticketId,
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        ticketVo.creationDate,
                        style: TextStyle(color: Colors.black, fontSize: 8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 35,

                        child: Text(
                          ticketVo.serviceRequest.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 8),
                          textAlign: TextAlign.center,


                      ),
                  ),


                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10),
                      child: Text(
                        'Slow Preformance',
                        style: TextStyle(color: Colors.black, fontSize: 8),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),


                  Container(
                    decoration: BoxDecoration(
                      color: ticketVo.status == 'Pending'
                          ? Colors.red
                          : ticketVo.status == 'Closed'
                              ? Colors.deepOrangeAccent
                              : Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(
                              24.0) //                 <--- border radius here
                          ),
                    ),

                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          ticketVo.status,
                          style: TextStyle(color: Colors.white, fontSize: 8),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
