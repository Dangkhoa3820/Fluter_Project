import 'dart:convert';

import 'package:flutter_application/services/MongoDB.dart';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDBModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

String mongoModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  MongoDbModel({
    required this.id,
    required this.Time,
    required this.thaotac,
  });

  ObjectId id;
  String Time;
  String thaotac;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
      id: json["_id"], 
      Time: json["Time"], 
      thaotac: json["thaotac"]
      );
  Map<String, dynamic> toJson() => {
        "_id": id,
        "Time": Time,
        "thaotac": thaotac,
      };
} 
