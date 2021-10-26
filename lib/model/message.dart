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
    required this.senderName,
    required this.text,
    required this.timeSent,
    required this.id,
    required this.v,
  });

  String conversationId;
  String senderId;
  String senderName;
  String text;
  DateTime timeSent;
  String id;
  int v;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        conversationId: json["conversationId"],
        senderId: json["senderId"],
        senderName: json["senderName"],
        text: json["text"],
        timeSent: DateTime.parse(json["timeSent"]),
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "conversationId": conversationId,
        "senderId": senderId,
        "senderName": senderName,
        "text": text,
        "timeSent": timeSent.toIso8601String(),
        "_id": id,
        "__v": v,
      };
}
