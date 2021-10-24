// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    required this.conversationId,
    required this.senderId,
    required this.text,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String conversationId;
  String senderId;
  String text;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        conversationId: json["conversationId"],
        senderId: json["senderId"],
        text: json["text"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "conversationId": conversationId,
        "senderId": senderId,
        "text": text,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
