import 'dart:convert';

NetworkResult networkResultFromJson(String str) => NetworkResult.fromJson(json.decode(str));

String networkResultToJson(NetworkResult data) => json.encode(data.toJson());

class NetworkResult {
  NetworkResult({
    this.status,
    this.responseCode,
    this.description,
    this.isRequieredUpdate,
    this.isforceUpdate,
  });

  String status;
  String responseCode;
  String description;
  bool isRequieredUpdate;
  bool isforceUpdate;

  factory NetworkResult.fromJson(Map<String, dynamic> json) => NetworkResult(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,
  };
}
