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
      String mes_data = "Nhấn nút Start From App";
      final data =
          MongoDbModel(id: _id, Time: formattedDate, thaotac: mes_data);
      var result = await mongoDB.insert(data);
      break;
  }
}
