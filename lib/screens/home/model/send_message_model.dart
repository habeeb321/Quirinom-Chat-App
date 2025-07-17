// To parse this JSON data, do
//
//     final sendMessageModel = sendMessageModelFromJson(jsonString);

import 'dart:convert';

SendMessageModel sendMessageModelFromJson(String str) =>
    SendMessageModel.fromJson(json.decode(str));

String sendMessageModelToJson(SendMessageModel data) =>
    json.encode(data.toJson());

class SendMessageModel {
  String? chatId;
  String? senderId;
  String? content;
  String? messageType;
  String? fileUrl;
  List<dynamic>? deletedBy;
  String? status;
  dynamic deliveredAt;
  dynamic seenAt;
  List<dynamic>? seenBy;
  String? id;
  List<dynamic>? reactions;
  DateTime? sentAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  SendMessageModel({
    this.chatId,
    this.senderId,
    this.content,
    this.messageType,
    this.fileUrl,
    this.deletedBy,
    this.status,
    this.deliveredAt,
    this.seenAt,
    this.seenBy,
    this.id,
    this.reactions,
    this.sentAt,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SendMessageModel.fromJson(Map<String, dynamic> json) =>
      SendMessageModel(
        chatId: json["chatId"],
        senderId: json["senderId"],
        content: json["content"],
        messageType: json["messageType"],
        fileUrl: json["fileUrl"],
        deletedBy: json["deletedBy"] == null
            ? []
            : List<dynamic>.from(json["deletedBy"].map((x) => x)),
        status: json["status"],
        deliveredAt: json["deliveredAt"],
        seenAt: json["seenAt"],
        seenBy: json["seenBy"] == null
            ? []
            : List<dynamic>.from(json["seenBy"].map((x) => x)),
        id: json["_id"],
        reactions: json["reactions"] == null
            ? []
            : List<dynamic>.from(json["reactions"].map((x) => x)),
        sentAt: json["sentAt"] == null ? null : DateTime.parse(json["sentAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "chatId": chatId,
        "senderId": senderId,
        "content": content,
        "messageType": messageType,
        "fileUrl": fileUrl,
        "deletedBy": deletedBy == null
            ? []
            : List<dynamic>.from((deletedBy ?? []).map((x) => x)),
        "status": status,
        "deliveredAt": deliveredAt,
        "seenAt": seenAt,
        "seenBy": seenBy == null
            ? []
            : List<dynamic>.from((seenBy ?? []).map((x) => x)),
        "_id": id,
        "reactions": reactions == null
            ? []
            : List<dynamic>.from((reactions ?? []).map((x) => x)),
        "sentAt": sentAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
