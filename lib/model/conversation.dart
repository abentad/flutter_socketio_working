// To parse this JSON data, do
//
//     final conversation = conversationFromJson(jsonString);

// import 'dart:convert';

// Conversation conversationFromJson(String str) => Conversation.fromJson(json.decode(str));

// String conversationToJson(Conversation data) => json.encode(data.toJson());

class Conversation {
  Conversation({required this.id, required this.members, required this.createdAt, required this.updatedAt, required this.v});

  String id;
  List<String> members;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
        id: json["_id"],
        members: List<String>.from(json["members"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "members": List<dynamic>.from(members.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
