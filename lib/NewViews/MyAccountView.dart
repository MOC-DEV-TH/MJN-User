import 'package:MJN/controllers/accountDetailController.dart';
import 'package:MJN/controllers/lastTransactionController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class MyAccountView extends StatefulWidget {
  @override
  _MyAccountViewState createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {

  final AccountDetailController accountDetailController =
  Get.put(AccountDetailController());

  final LastTransactionController lastTransactionController =
  Get.put(LastTransactionController());

  final loginDataStorage = GetStorage();

  @override
  void initState() {
    super.initState();

    accountDetailController.fetchAccountInfoData(loginDataStorage.read(TOKEN),
        loginDataStorage.read(UID), loginDataStorage.read(DATA_TENANT_ID)).then((value) => {

    lastTransactionController.fetchLastTransactionData(
    loginDataStorage.read(TOKEN),
    loginDataStorage.read(UID),
    loginDataStorage.read(DATA_TENANT_ID))
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Color(0xff188FC5),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [

            _buildAccountDetailView(),

            _buildTransactionDetailView(),

          ],),
        ),
      ),
    );
  }

  Widget _buildAccountDetailView(){

    return Obx((){
      if (accountDetailController.isLoading.value) {

        return Center(
          child: CircularProgressIndicator(),
        );
      }
      else {
       return Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 12,top: 12,right: 40,bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16, color: Color(0xffe9e9e9)),
                ),


                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 14, color: Color(0xffe9e9e9)),
                    ),


                    Text(
                      ': ${accountDetailController.accountInfoVo.details.firstname}'
                      ,
                      style: TextStyle(
                          fontSize: 14, color: Color(0xffe9e9e9)),
                    ),
                  ],),

                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 14, color: Color(0xffe9e9e9)),
                    ),

                    Text(
                      ': ${accountDetailController.accountInfoVo.details.mail}'
                      ,
                      style: TextStyle(
                          fontSize: 14, color: Color(0xffe9e9e9)),
                    ),
                  ],),

                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'User Name',
                      style: TextStyle(
                          fontSize: 14, color: Color(0xffe9e9e9)),
                    ),

                    Text(
                      ': ${accountDetailController.accountInfoVo.details.name}'
                      ,
                      style: TextStyle(
                          fontSize: 14, color: Color(0xffe9e9e9)),
                    ),
                  ],),



                SizedBox(height: 20,),
                Container(width: MediaQuery.of(context).size.width,height: 1,color: Color(0xffe9e9e9),),

                SizedBox(height: 20,),
                Text(
                  'Subscription Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16, color: Color(0xffe9e9e9)),
                ),

                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Start date',
                      style: TextStyle(
                          fontSize: 14, color: Color(0xffe9e9e9)),
                    ),

                    Text(
                     ':  ${accountDetailController.accountInfoVo.details.creationDate}',
                      style: TextStyle(
                          fontSize: 14, color: Color(0xffe9e9e9)),
                    ),
                  ],),

                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'End date',
                      style: TextStyle(
                          fontSize: 14, color: Color(0xffe9e9e9)),
                    ),

                    Text(
                      ':  ${accountDetailController.accountInfoVo.details.modifiedDate}',
                      style: TextStyle(
                          fontSize: 14, color: Color(0xffe9e9e9)),
                    ),
                  ],),


              ],),
          ),
        );
      }
    });
  }



  Widget _buildTransactionDetailView(){

    return
    Obx((){
      if (lastTransactionController.isLoading.value) {
        return Container(
        );
      }
      else {
        return
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 12,top: 12,right: 40,bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(width: MediaQuery.of(context).size.width,height: 1,color: Color(0xffe9e9e9),),

                  SizedBox(height: 20,),

                  Text(
                    'Last Transaction details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16, color: Color(0xffe9e9e9)),
                  ),


                  SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transaction ID',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),

                      Text(
                        ':  ${lastTransactionController.transactionVo.details.transactionId}',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),
                    ],),

                  SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transaction Date',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),

                      Text(
                        ':  ${lastTransactionController.transactionVo.details.creationDate}',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),
                    ],),

                  SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Package',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),

                      Text(
                        ': 20Mbps',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),
                    ],),

                  SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),

                      Text(
                        ': ${(lastTransactionController
                            .transactionVo
                            .details
                            .paymentTotal
                        ) +
                            ' ' +
                            (lastTransactionController
                                .transactionVo
                                .details
                                .currencyType
                            )}',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),
                    ],),
                  SizedBox(height: 15,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),

                      Text(
                        ': ${(lastTransactionController
                            .transactionVo
                            .details
                            .paymentTotal
                        ) +
                            ' ' +
                            (lastTransactionController
                                .transactionVo
                                .details
                                .currencyType
                            )}',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),
                    ],),

                  SizedBox(height: 15,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Paid date',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),

                      Text(
                        ':  ${lastTransactionController.transactionVo.details.creationDate}',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),
                    ],),

                  SizedBox(height: 15,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sales representative',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),


                      Text(
                        ': Win Htut Oo',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xffe9e9e9)),
                      ),
                    ],),

                  SizedBox(height: 20,),

                  Container(width: MediaQuery.of(context).size.width,height: 1,color: Color(0xffe9e9e9),),


                ],),
            ),

          );
      }
    });

  }

}
