import 'dart:convert';

TransactionListVo transactionListVoFromJson(String str) => TransactionListVo.fromJson(json.decode(str));

String transactionListVoToJson(TransactionListVo data) => json.encode(data.toJson());

class TransactionListVo {
  TransactionListVo({
    this.status,
    this.responseCode,
    this.description,
    this.isRequieredUpdate,
    this.isforceUpdate,
    this.details,
  });

  String status;
  String responseCode;
  String description;
  bool isRequieredUpdate;
  bool isforceUpdate;
  List<Detail> details;

  factory TransactionListVo.fromJson(Map<String, dynamic> json) => TransactionListVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    this.transactionId,
    this.paymentTotal,
    this.currencyType,
    this.startDate,
    this.endDate,
    this.paidDate,
    this.creationDate,
    this.modifiedDate,
    this.isCreditNote,
    this.creditWith,
    this.creditAmount,
    this.creditCurrency,
    this.creditDate,
  });

  String transactionId;
  String paymentTotal;
  String currencyType;
  String startDate;
  String endDate;
  String paidDate;
  String creationDate;
  String modifiedDate;
  String isCreditNote;
  dynamic creditWith;
  dynamic creditAmount;
  dynamic creditCurrency;
  dynamic creditDate;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    transactionId: json["transaction_id"],
    paymentTotal: json["payment_total"],
    currencyType: json["currency_type"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    paidDate: json["paid_date"],
    creationDate: json["creation_date"],
    modifiedDate: json["modified_date"],
    isCreditNote: json["isCreditNote"],
    creditWith: json["credit_with"],
    creditAmount: json["credit_amount"],
    creditCurrency: json["credit_currency"],
    creditDate: json["credit_date"],
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "payment_total": paymentTotal,
    "currency_type": currencyType,
    "start_date": startDate,
    "end_date": endDate,
    "paid_date": paidDate,
    "creation_date": creationDate,
    "modified_date": modifiedDate,
    "isCreditNote": isCreditNote,
    "credit_with": creditWith,
    "credit_amount": creditAmount,
    "credit_currency": creditCurrency,
    "credit_date": creditDate,
  };
}
