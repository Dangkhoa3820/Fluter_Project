import 'dart:convert';

import 'package:flutter_application/services/MongoDB.dart';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel_quantity mongoDBModelFromJson(String str) =>
    MongoDbModel_quantity.fromJson(json.decode(str));

String mongoModelToJson(MongoDbModel_quantity data) => json.encode(data.toJson());

class MongoDbModel_quantity {
  MongoDbModel_quantity({
    required this.id,
    required this.Time,
    required this.Sp1,
    required this.Sp2,
    required this.Sp3,
  });

  ObjectId id;
  String Time;
  String Sp1;
  String Sp2;
  String Sp3;

  factory MongoDbModel_quantity.fromJson(Map<String, dynamic> json) => MongoDbModel_quantity(
      id: json["_id"], 
      Time: json["Time"], 
      Sp1: json["Sp1"],
      Sp2: json["Sp2"],
      Sp3: json["Sp3"]
      );
  Map<String, dynamic> toJson() => {
        "_id": id,
        "Time": Time,
        "Sp1": Sp1,
        "Sp2": Sp2,
        "Sp3": Sp3,
      };
} 
