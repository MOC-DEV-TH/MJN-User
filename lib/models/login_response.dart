// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.status,
    this.responseCode,
    this.description,
    this.isRequieredUpdate,
    this.isforceUpdate,
    this.uid,
    this.userName,
    this.phone,
    this.token,
    this.details,
  });

  String status;
  String responseCode;
  String description;
  bool isRequieredUpdate;
  bool isforceUpdate;
  String uid;
  String userName;
  String phone;
  String token;
  List<Detail> details;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    uid: json["uid"],
    userName: json["user_name"],
    phone: json["phone"],
    token: json["token"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,
    "uid": uid,
    "user_name": userName,
    "phone": phone,
    "token": token,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    this.tenantId,
    this.building,
    this.unit,
  });

  String tenantId;
  String building;
  String unit;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    tenantId: json["tenant_id"],
    building: json["building"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "tenant_id": tenantId,
    "building": building,
    "unit": unit,
  };
}
