import 'package:flutter/material.dart';
import 'package:flutter_application/NavBar.dart';
import 'package:flutter_application/pages/TotalProduct.dart';
import 'package:flutter_application/services/MongoDB.dart';
import 'package:flutter_application/services/models/Alarm.dart';
import 'package:flutter_application/services/models/Thaotacnguoidung.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Alarms extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0.0,
      backgroundColor:Color(0xFF212332),
      title: Text('Alarm'),
    ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Text(
                    'Alarm View',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 197, 153, 9),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'ID',
                      style: TextStyle(
                          fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),
                    ),
                    Text(
                      'Time',
                      style: TextStyle(
                          fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),
                    ),
                    Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),
                    ),
                    Text(
                      'Detail',
                      style: TextStyle(
                          fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: SafeArea(
              child: FutureBuilder(
                  future: mongoDB.getData_alarm(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasData) {
                        var totalAlarm= snapshot.data.length;
                        print('Total Data' + totalAlarm.toString());
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return displayCard(
                                MongoDbModel_alarm.fromJson(snapshot.data[index]));
                          },
                        );
                      } else {
                        return Center(
                          child: Text("No Data Available"),
                        );
                      }
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
    Widget displayCard(MongoDbModel_alarm data) {
      return Table(
        defaultColumnWidth: FixedColumnWidth(90.0),
        border: TableBorder(
          bottom: BorderSide(
              width: 1.0,
              color: Colors.grey.withOpacity(0.5),
              style: BorderStyle.solid),
          verticalInside: BorderSide(
              width: 1.0,
              color: Colors.grey.withOpacity(0.5),
              style: BorderStyle.solid),
        ),
        children: [
          TableRow(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${data.id}',
                    style: TextStyle(fontSize: 15.0),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${data.Time}',
                    style: TextStyle(fontSize: 15.0),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${data.Name}',
                    style: TextStyle(fontSize: 15.0),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${data.Detail}',
                    style: TextStyle(fontSize: 15.0),
                  ),
                )
              ],
            ),
          ]),
        ],
      );
    }
  }

