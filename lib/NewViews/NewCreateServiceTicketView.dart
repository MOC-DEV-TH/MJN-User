import 'package:MJN/Network/Request/RequestCreateTicket.dart';
import 'package:MJN/NewViews/SuccessCreateTicketView.dart';
import 'package:MJN/controllers/createTicketController.dart';
import 'package:MJN/controllers/serviceRequestTypeController.dart';
import 'package:MJN/models/invoiceListVO.dart';
import 'package:MJN/models/serviceRequestTypeVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class NewCreateServiceTicketView extends StatefulWidget {
  @override
  _NewCreateServiceTicketViewState createState() =>
      _NewCreateServiceTicketViewState();
}

class _NewCreateServiceTicketViewState
    extends State<NewCreateServiceTicketView> {
  var buildingText = TextEditingController();
  var unitText = TextEditingController();
  var emailText = TextEditingController();
  var phoneNoText = TextEditingController();
  var nameText = TextEditingController();
  var messageText = TextEditingController();
  var wifiText = TextEditingController();

  var selectServiceRequestIndex;

  final CreateTicketController createTicketController =
      Get.put(CreateTicketController());

  final ServiceRequestTypeController serviceRequestTypeController =
      Get.put(ServiceRequestTypeController());

  int changePageIndex = 0;
  final loginDataStorage = GetStorage();

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();

    serviceRequestTypeController.fetchServiceRequestType();
  }

  @override
  Widget build(BuildContext context) {
    return changePageIndex == 1
        ? SuccessCreateTicketView()
        : Scaffold(
            backgroundColor: Color(0xff188FC5),
            body: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 150,
                                margin: EdgeInsets.only(right: 20),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 28),
                                        child: Text(
                                          'Name',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xffe9e9e9)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'Building',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xffe9e9e9)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'Unit',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xffe9e9e9)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'Email',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xffe9e9e9)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'Phone Number',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xffe9e9e9)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'WiFi Name(SSID)',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xffe9e9e9)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25),
                                        child: Text(
                                          'Type of Service Request',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xffe9e9e9)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'Message',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xffe9e9e9)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 80,
                                      ),
                                    ]),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffe9e9e9)),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: nameText,
                                          style: TextStyle(
                                              color: Color(0xffe9e9e9),
                                              fontSize: 14),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffe9e9e9)),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: buildingText,
                                          style: TextStyle(
                                              color: Color(0xffe9e9e9),
                                              fontSize: 14),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffe9e9e9)),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: unitText,
                                          style: TextStyle(
                                              color: Color(0xffe9e9e9),
                                              fontSize: 14),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffe9e9e9)),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: emailText,
                                          style: TextStyle(
                                              color: Color(0xffe9e9e9),
                                              fontSize: 14),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffe9e9e9)),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: phoneNoText,
                                          style: TextStyle(
                                              color: Color(0xffe9e9e9),
                                              fontSize: 14),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffe9e9e9)),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: wifiText,
                                          style: TextStyle(
                                              color: Color(0xffe9e9e9),
                                              fontSize: 14),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Obx(() {
                                      if (serviceRequestTypeController
                                          .isLoading.value) {
                                        return Container();
                                      } else {
                                        return Container(
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxHeight: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ),
                                            child: Neumorphic(
                                              style: NeumorphicStyle(
                                                shape: NeumorphicShape.concave,
                                                color: Colors.transparent,
                                                border: NeumorphicBorder(
                                                  color: Color(0xffe9e9e9),
                                                  width: 0.8,
                                                ),
                                                boxShape: NeumorphicBoxShape
                                                    .roundRect(
                                                        BorderRadius.circular(
                                                            0)),
                                                depth: -4,
                                                lightSource:
                                                    LightSource.topLeft,
//                    color: Colors.grey
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 2),
                                                child: DropdownButtonFormField<
                                                    DetailType>(
                                                  dropdownColor:
                                                      Color(0xff188FC5),
                                                  onChanged: (value) {
                                                    selectServiceRequestIndex =
                                                        value!.id;
                                                  },
                                                  items:
                                                      serviceRequestTypeController
                                                          .serviceRequestTypeVo
                                                          .details
                                                          .map((label) =>
                                                              DropdownMenuItem(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(left: 15),
                                                                    child: Text(
                                                                      label.name
                                                                          .toString(),
                                                                      textAlign: TextAlign.end,
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffe9e9e9),
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                  ),

                                                                value: label,
                                                              ))
                                                          .toList(),
                                                  hint: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20),
                                                    child: Text(
                                                      '-Select Service Request-',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xffe9e9e9)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    }),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      height: 100,
                                      padding: EdgeInsets.only(
                                          left: 4, top: 4, right: 4),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffe9e9e9)),
                                      ),
                                      child: TextField(
                                        controller: messageText,
                                        style: TextStyle(color:  Color(
                                            0xffe9e9e9)),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                              margin: EdgeInsets.only(bottom: 50),
                              width: 150,
                              child:
                                  // ignore: missing_return
                                  Obx(() {
                                if (createTicketController.isLoading.value) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );

                                } else {
                                  return NeumorphicButton(
                                    onPressed: () {

                                      if (buildingText.text == '' ||
                                          unitText.text == '' ||
                                          emailText.text == '' ||
                                          phoneNoText.text == '' ||
                                          nameText.text == '' ||
                                          messageText.text == '' ||
                                          selectServiceRequestIndex == null) {
                                        AppUtils.showErrorSnackBar(
                                            'Error!!', 'Data must not empty!!');
                                      } else {
                                        RequestCreateTicket requestCreateTicket =
                                            new RequestCreateTicket(
                                                nameText.value.text,
                                                loginDataStorage.read(BUILDING).toString(),
                                                loginDataStorage.read(UNIT),
                                                emailText.value.text,
                                                loginDataStorage.read(PHONE_NO),
                                                selectServiceRequestIndex.toString(),
                                                '99',
                                                "Topic Other",
                                                messageText.value.text,
                                                loginDataStorage.read(DATA_TENANT_ID),
                                                loginDataStorage.read(UID),
                                                app_version);

                                        createTicketController.createTicket(
                                            requestCreateTicket,
                                            loginDataStorage.read(TOKEN),
                                            context).then((value) => {

                                        if(createTicketController.networkResult.status == 'Success'){
                                            Future.delayed(const Duration(milliseconds: 700), () {
                                      setState(() {
                                      changePageIndex = 1;
                                      });
                                      })
                                    }

                                        });



                                      }

                                    },
                                    child: Center(
                                      child: Text(
                                        "Send",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                    ),
                                    style: NeumorphicStyle(
                                      shape: NeumorphicShape.flat,
                                      color: Color(0xffffcc35),
                                      depth: 0,
//                lightSource: LightSource.topLeft,
                                    ),
                                  );
                                }
                              })),
                        ],
                      ),
                    ),
                  )),
            ),
          );
  }
}
