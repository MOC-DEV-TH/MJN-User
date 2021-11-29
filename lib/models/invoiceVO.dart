import 'dart:convert';

InvoiceVo invoiceVoFromJson(String str) => InvoiceVo.fromJson(json.decode(str));

String invoiceVoToJson(InvoiceVo data) => json.encode(data.toJson());

class InvoiceVo {
  InvoiceVo({
    required this.status,
    required  this.responseCode,
    required this.description,
    required this.isRequieredUpdate,
    required this.isforceUpdate,
    required this.details,
  });

  String status;
  String responseCode;
  String description;
  bool isRequieredUpdate;
  bool isforceUpdate;
  Details details;

  factory InvoiceVo.fromJson(Map<String, dynamic> json) => InvoiceVo(
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
    required   this.invoiceId,
    required  this.paymentTotal,
    required this.currencyType,
    required  this.startDate,
    required this.endDate,
    required  this.creationDate,
    required  this.modifiedDate,
  });

  String invoiceId;
  String paymentTotal;
  String currencyType;
  String startDate;
  String endDate;
  String creationDate;
  String modifiedDate;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    invoiceId: json["invoice_id"],
    paymentTotal: json["payment_total"],
    currencyType: json["currency_type"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    creationDate: json["creation_date"],
    modifiedDate: json["modified_date"],
  );

  Map<String, dynamic> toJson() => {
    "invoice_id": invoiceId,
    "payment_total": paymentTotal,
    "currency_type": currencyType,
    "start_date": startDate,
    "end_date": endDate,
    "creation_date": creationDate,
    "modified_date": modifiedDate,
  };
}
