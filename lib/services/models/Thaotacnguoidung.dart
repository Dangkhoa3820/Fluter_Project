import 'dart:convert';

import 'package:flutter_application/services/MongoDB.dart';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel_thaotac mongoDBModelFromJson(String str) =>
    MongoDbModel_thaotac.fromJson(json.decode(str));

String mongoModelToJson(MongoDbModel_thaotac data) => json.encode(data.toJson());

class MongoDbModel_thaotac {
  MongoDbModel_thaotac({
    required this.id,
    required this.Time,
    required this.thaotac,
  });

  ObjectId id;
  String Time;
  String thaotac;

  factory MongoDbModel_thaotac.fromJson(Map<String, dynamic> json) => MongoDbModel_thaotac(
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
