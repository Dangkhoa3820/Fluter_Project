import 'package:flutter/material.dart';
import 'package:flutter_application/services/MongoDB.dart';
import 'package:flutter_application/services/models/quantity.dart';
import 'package:mongo_dart/mongo_dart.dart';

class History extends StatelessWidget {
  String _id = 'null';
  String _Time = 'null';
  String _Controller = 'null';
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF212332),
          title: Text('History'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('ID', style: TextStyle(fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),),
                  Text('Time', style: TextStyle(fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),),
                  Text('Controller', style: TextStyle(fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),),
                ],
              ),
              ),
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SafeArea(
                  child: FutureBuilder(
                      future: mongoDB.getData(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          if (snapshot.hasData) {
                            var totalData = snapshot.data.length;
                            print('Total Data' + totalData.toString());
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return displayCard(
                                    MongoDbModel.fromJson(snapshot.data[index]));
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
            ),
          ],
        ),
      );
  Widget displayCard(MongoDbModel data) {
    return Table(
      defaultColumnWidth: FixedColumnWidth(120.0),
      border: TableBorder(
        bottom: BorderSide(
            width: 1.5, color: Colors.grey, style: BorderStyle.solid),
      ),
      children: [
        TableRow(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
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
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  '${data.Time}',
                  style: TextStyle(fontSize: 15.0),
                ),
              )
            ],
          ),
          Column(
            children: [
              Text(
                '${data.thaotac}',
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ]),
      ],
    );
  }
}
