import 'dart:developer';

import 'package:flutter_application/services/models/Alarm.dart';
import 'package:flutter_application/services/models/Thaotacnguoidung.dart';
import 'package:flutter_application/services/models/Tongsanpham.dart';
import 'package:flutter_application/services/variables.dart';
import 'package:mongo_dart/mongo_dart.dart';

class mongoDB {
  static var db, userCollection, account, quantity, alarm;
  static connect() async {
    db = await Db.create(
        "mongodb+srv://user_1:7jYGyh3kzVDbO3Ia@cluster0.yhkkk.mongodb.net/PHANLOAISANPHAM?retryWrites=true&w=majority");
    await db.open();
    inspect(db);
    userCollection = db.collection("Thaotacnguoidung");
    account = db.collection("Account");
    quantity = db.collection("Tongsanpham");
    alarm = db.collection("Alarm");
  }

  static Future<List<Map<String, dynamic>>> getData_thaotac() async {
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<List<Map<String, dynamic>>> getData_quantity() async {
    final Data_thaotac = await quantity.find().toList();
    return Data_thaotac;
  }

  static Future<List<Map<String, dynamic>>> getData_alarm() async {
    final Data_alarm = await alarm.find().toList();
    return Data_alarm;
  }

  static Future<String> findData(String usr_data, String pass_data) async {
    var Data = await account.findOne(where.eq('username', '${usr_data}').and(where.eq('password','${pass_data}')));
    if (Data != null) {
      Login = true;
    } else {
      Login = false;
    }
    return "Login check";
  }

  static Future<String> insert_thaotac(MongoDbModel_thaotac data) async {
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

  static Future<String> insert_quantity(MongoDbModel_quantity data) async {
    try {
      var result = await quantity.insertOne(data.toJson());
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

  static Future<String> insert_alarm(MongoDbModel_alarm data) async {
    try {
      var result = await alarm.insertOne(data.toJson());
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

  static delete_ControlView(MongoDbModel_thaotac user) async {
    await userCollection.remove(where.id(user.id));
  }

  static delete_Quantity(MongoDbModel_quantity user) async {
    await quantity.remove(where.id(user.id));
  }

  static delete_Alarm(MongoDbModel_alarm user) async {
    await alarm.remove(where.id(user.id));
  }
}
