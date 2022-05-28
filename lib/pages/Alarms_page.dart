import 'package:flutter/material.dart';
import 'package:flutter_application/NavBar.dart';
import 'package:flutter_application/pages/TotalProduct.dart';
import 'package:flutter_application/services/MongoDB.dart';
import 'package:flutter_application/services/models/Alarm.dart';
import 'package:flutter_application/services/models/Thaotacnguoidung.dart';

class Alarms extends StatefulWidget {
  @override
  _AlarmsState createState() => _AlarmsState();
}

class _AlarmsState extends State<Alarms> {
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
                Container(
                  height: 30,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:55.0),
                        child: Text(
                          '    ID',
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:35.0),
                        child: Text(
                          'Time',
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:25.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),
                        ),
                      ),
                      Text(
                        'Detail',
                        style: TextStyle(
                            fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),
                      ),
                    ],
                  ),
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
        columnWidths: {
          0: FixedColumnWidth(55),
          1: FixedColumnWidth(85),
          2: FixedColumnWidth(50),
          3: FixedColumnWidth(80),
          4: FixedColumnWidth(40),
        },
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
          Column(
              children: [
              Row(
                children: [
                  //Text('Delete'),
                  IconButton(
                    icon: Icon(Icons.delete_forever),
                    color: Colors.red,
                    onPressed: () async {
                      await mongoDB.delete_Alarm(data);
                      setState(() {
                      });
                    },
                  ),
                ],
              ),
            ],
            ),
          ]),
        ],
      );
    }
}

