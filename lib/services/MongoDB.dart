import 'dart:developer';

import 'package:flutter_application/services/models/quantity.dart';
import 'package:mongo_dart/mongo_dart.dart';

class mongoDB {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(
        "mongodb+srv://user_1:LAc71dSllDAah0wa@cluster0.yhkkk.mongodb.net/PHANLOAISANPHAM?retryWrites=true&w=majority");
    await db.open();
    inspect(db);
    userCollection = db.collection("Thaotacnguoidung");
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Insert";
      } else {
        return " Error Data Insert";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
