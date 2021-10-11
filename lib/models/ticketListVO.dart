import 'dart:convert';

TicketListVo ticketListVoFromJson(String str) => TicketListVo.fromJson(json.decode(str));

String ticketListVoToJson(TicketListVo data) => json.encode(data.toJson());

class TicketListVo {
  TicketListVo({
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
  List<TicketDetail> details;

  factory TicketListVo.fromJson(Map<String, dynamic> json) => TicketListVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    details: List<TicketDetail>.from(json["details"].map((x) => TicketDetail.fromJson(x))),
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

class TicketDetail {
  TicketDetail({
    this.ticketId,
    this.serviceRequest,
    this.serviceRequestOther,
    this.topic,
    this.topicOther,
    this.status,
    this.message,
    this.resolvedTime,
    this.creationDate,
  });

  String ticketId;
  String serviceRequest;
  dynamic serviceRequestOther;
  String topic;
  String topicOther;
  String status;
  String message;
  String resolvedTime;
  String creationDate;

  factory TicketDetail.fromJson(Map<String, dynamic> json) => TicketDetail(
    ticketId: json["ticket_id"],
    serviceRequest: json["service_request"],
    serviceRequestOther: json["service_request_other"],
    topic: json["topic"],
    topicOther: json["topic_other"],
    status: json["status"],
    message: json["message"],
    resolvedTime: json["resolved_time"],
    creationDate: json["creation_date"],
  );

  Map<String, dynamic> toJson() => {
    "ticket_id": ticketId,
    "service_request": serviceRequest,
    "service_request_other": serviceRequestOther,
    "topic": topic,
    "topic_other": topicOther,
    "status": status,
    "message": message,
    "resolved_time": resolvedTime,
    "creation_date": creationDate,
  };
}
