import 'package:flutter/material.dart';
import 'package:flutter_application/services/MongoDB.dart';
import 'package:flutter_application/services/models/quantity.dart';
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
          MongoDbModel(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert(data);
      break;
      case 1:
      var _id = M.ObjectId();
      String mes_data = "Click Button Stop From App";
      final data =
          MongoDbModel(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert(data);
      break;
      case 2:
      var _id = M.ObjectId();
      String mes_data = "Click Button Reset From App";
      final data =
          MongoDbModel(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert(data);
      break;
      case 3:
      var _id = M.ObjectId();
      String mes_data = "Emer On From App";
      final data =
          MongoDbModel(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert(data);
      break;
      case 4:
      var _id = M.ObjectId();
      String mes_data = "Emer Off From App";
      final data =
          MongoDbModel(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert(data);
      break;
  }
}
