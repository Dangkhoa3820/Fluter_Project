import 'package:flutter/material.dart';
import 'package:flutter_application/services/MongoDB.dart';
import 'package:flutter_application/services/models/Alarm.dart';
import 'package:flutter_application/services/models/Thaotacnguoidung.dart';
import 'package:flutter_application/services/models/Tongsanpham.dart';
import 'package:flutter_application/services/variables.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:intl/intl.dart';

Future<void> thaotacFunction(BuildContext context, int index) async {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat("dd/MM/yyyy" + " " "kk:mm:ss").format(now);
  switch (index) {
    case 0:
      var _id = M.ObjectId();
      String mes_data = "Click Button Start From App";
      final data =
          MongoDbModel_thaotac(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert_thaotac(data);
      break;
      case 1:
      var _id = M.ObjectId();
      String mes_data = "Click Button Stop From App";
      final data =
          MongoDbModel_thaotac(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert_thaotac(data);
      break;
      case 2:
      var _id = M.ObjectId();
      String mes_data = "Click Button Reset From App";
      final data =
          MongoDbModel_thaotac(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert_thaotac(data);
      break;
      case 3:
      var _id = M.ObjectId();
      String mes_data = "Emer On From App";
      final data =
          MongoDbModel_thaotac(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert_thaotac(data);
      break;
      case 4:
      var _id = M.ObjectId();
      String mes_data = "Emer Off From App";
      final data =
          MongoDbModel_thaotac(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert_thaotac(data);
      break;
      case 5:
      var _id = M.ObjectId();
      String mes_data = "Color Check From App";
      final data =
          MongoDbModel_thaotac(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert_thaotac(data);
      break;
      case 6:
      var _id = M.ObjectId();
      String mes_data = "QR Check From App";
      final data =
          MongoDbModel_thaotac(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert_thaotac(data);
      break;
      case 7:
      var _id = M.ObjectId();
      String mes_data = "Auto On From App";
      final data =
          MongoDbModel_thaotac(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert_thaotac(data);
      break;
      case 8:
      var _id = M.ObjectId();
      String mes_data = "Man On From App";
      final data =
          MongoDbModel_thaotac(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert_thaotac(data);
      break;
      case 9:
      var _id = M.ObjectId();
      String mes_data = "Setting Product From App";
      final data =
          MongoDbModel_thaotac(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert_thaotac(data);
      break;
  }
}

  Future<void> QuantityFunction() async {
  DateTime now = DateTime.now();
  var _id = M.ObjectId();
  String formattedDate = DateFormat("dd/MM/yyyy" + " " "kk:mm:ss").format(now);
  final data = MongoDbModel_quantity(
      id: _id,
      Time: formattedDate,
      Sp1: SoluongSp1,
      Sp2: SoluongSp2,
      Sp3: SoluongSp3);
  var result = await mongoDB.insert_quantity(data);
}

Future<void> AlarmFunction() async {
  DateTime now = DateTime.now();
  var _id = M.ObjectId();
  String formattedDate = DateFormat("dd/MM/yyyy" + " " "kk:mm:ss").format(now);
  final data = MongoDbModel_alarm(
      id: _id,
      Time: formattedDate,
      Name: name,
      Detail:detail,);
  var result = await mongoDB.insert_alarm(data);
}
