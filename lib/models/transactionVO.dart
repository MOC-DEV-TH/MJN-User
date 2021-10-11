import 'dart:convert';

TransactionVo transactionVoFromJson(String str) => TransactionVo.fromJson(json.decode(str));

String transactionVoToJson(TransactionVo data) => json.encode(data.toJson());

class TransactionVo {
  TransactionVo({
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
  Details details;

  factory TransactionVo.fromJson(Map<String, dynamic> json) => TransactionVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    details: Details.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,
    "details": details.toJson(),
  };
}

class Details {
  Details({
    this.transactionId,
    this.paymentTotal,
    this.currencyType,
    this.startDate,
    this.endDate,
    this.paidDate,
    this.creationDate,
    this.modifiedDate,
  });

  String transactionId;
  String paymentTotal;
  String currencyType;
  String startDate;
  String endDate;
  String paidDate;
  String creationDate;
  String modifiedDate;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    transactionId: json["transaction_id"],
    paymentTotal: json["payment_total"],
    currencyType: json["currency_type"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    paidDate: json["paid_date"],
    creationDate: json["creation_date"],
    modifiedDate: json["modified_date"],
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
  };
}
