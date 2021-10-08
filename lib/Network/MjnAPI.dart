import 'dart:convert';

import 'package:MJN/Network/Request/RequestCreateTicket.dart';
import 'package:MJN/models/NetworkResultVO.dart';
import 'package:MJN/models/accountInfoVO.dart';
import 'package:MJN/models/invoiceListVO.dart';
import 'package:MJN/models/loginVO.dart';
import 'package:MJN/models/ticketListVO.dart';
import 'package:MJN/models/ticketVO.dart';
import 'package:MJN/models/transactionListVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class MjnAPI {
  static final String securityKey = 'moJoENEt2021sECuriTYkEy';
  static var client = http.Client();

  static Future<LoginVo> fetchLoginData(
      Map<String, String> params) async {
    var response = await client.post(
      LOGIN_URL,
      body: json.encode(params),
      headers: {
        'content-type': 'application/json',
        "security_key": securityKey
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var login = loginVoFromJson(json);
      return login;
    } else {
      return null;
    }
  }

  static Future<AccountInfoVo> fetchAccountInfoData(
      String token, String uid, String tenantID) async {
    var response = await client.get(
      GET_ACCOUNT_INFO_URL +
          UID + uid +
          APP_VERSION + app_version +
          TENANT_ID + tenantID,
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var accountInfoData = accountInfoVoFromJson(json);
      return accountInfoData;
    } else {
      return null;
    }
  }


  static Future<InvoiceListVo> fetchPaymentInvoiceList(
      String token, String uid, String tenantID) async {
    var response = await client.get(
      GET_INVOICE_LIST_URL +
          UID + uid +
          APP_VERSION + app_version +
          TENANT_ID + tenantID,
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var invoiceList = invoiceListVoFromJson(json);
      return invoiceList;
    } else {
      return null;
    }
  }


  static Future<TransactionListVo> fetchTransactionList(
      String token, String uid, String tenantID) async {
    var response = await client.get(
      GET_TRANSACTION_LIST_URL +
          UID + uid +
          APP_VERSION + app_version +
          TENANT_ID + tenantID,
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var transactionList = transactionListVoFromJson(json);
      return transactionList;
    } else {
      return null;
    }
  }


  static Future<TicketListVo> fetchTicketList(
      String token, String uid, String tenantID) async {
    var response = await client.get(
      GET_TICKET_LIST_URL +
          UID + uid +
          APP_VERSION + app_version +
          TENANT_ID + tenantID,
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var ticketList = ticketListVoFromJson(json);
      return ticketList;
    } else {
      return null;
    }
  }

  static Future<TicketVo> fetchTicketByTicketID(
      String token, String uid, String ticketID) async {
    var response = await client.get(
      GET_TICKET_URL +
          UID + uid +
          APP_VERSION + app_version +
          TICKET_ID + ticketID,
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var ticket = ticketVoFromJson(json);
      return ticket;
    } else {
      return null;
    }
  }

  static Future createTicket(
      RequestCreateTicket requestCreateTicket,String token) async {

    var bodyValue = requestCreateTicket.toJson();
    var bodyData = json.encode(bodyValue);
    var response = await client.post(
      CREATE_TICKET_URL ,
      body: bodyData,
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var result = networkResultFromJson(json);
      return result;
    } else {
      return null;
    }
  }

}
