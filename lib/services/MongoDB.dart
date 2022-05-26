import 'dart:developer';

import 'package:flutter_application/services/models/quantity.dart';
import 'package:mongo_dart/mongo_dart.dart';

class mongoDB {
  static var db, userCollection, account;
  static connect() async {
    db = await Db.create(
        "mongodb+srv://user_1:7jYGyh3kzVDbO3Ia@cluster0.yhkkk.mongodb.net/PHANLOAISANPHAM?retryWrites=true&w=majority");
    await db.open();
    inspect(db);
    userCollection = db.collection("Thaotacnguoidung");
    account = db.collection("Account");
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<String> findData() async {
    var usrData = await account.findOne(
        where.match('username', 'admin')).tolist();
    print(usrData);
    return usrData;
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
