import 'dart:convert';

import 'package:flutter_application/services/MongoDB.dart';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel_alarm mongoDBModelFromJson(String str) =>
    MongoDbModel_alarm.fromJson(json.decode(str));

String mongoModelToJson(MongoDbModel_alarm data) => json.encode(data.toJson());

class MongoDbModel_alarm {
  MongoDbModel_alarm({
    required this.id,
    required this.Time,
    required this.Name,
    required this.Detail,
  });

  ObjectId id;
  String Time;
  String Name;
  String Detail;

  factory MongoDbModel_alarm.fromJson(Map<String, dynamic> json) => MongoDbModel_alarm(
      id: json["_id"], 
      Time: json["Time"], 
      Name: json["Name"],
      Detail: json["Detail"],
      );
  Map<String, dynamic> toJson() => {
        "_id": id,
        "Time": Time,
        "Name": Name,
        "Detail": Detail,
      };
} 
