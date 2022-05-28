import 'package:flutter/material.dart';
import 'package:flutter_application/NavBar.dart';
import 'package:flutter_application/pages/History_page.dart';
import 'package:flutter_application/pages/TotalProduct.dart';
import 'package:flutter_application/services/MongoDB.dart';
import 'package:flutter_application/services/models/Thaotacnguoidung.dart';
import 'package:flutter_application/services/models/Tongsanpham.dart';

class TotalProductView extends StatefulWidget {
  @override
  _TotalProductViewState createState() => _TotalProductViewState();
}

class _TotalProductViewState extends State<TotalProductView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: NavBar(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.arrow_back),
        ),
        elevation: 0.0,
        backgroundColor: Color(0xFF212332),
        title: Text('History'),
        actions: [
          Container(
            width: 180,
            height: 50,
            child: IconButton(
              icon: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.navigate_next_outlined,
                        size: 18,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(
                      text: 'Control view',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15.0,
                        decoration: TextDecoration.underline,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => History()),
                );
              },
            ),
          ),
        ],
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
                    'Total Product View',
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
                        padding: const EdgeInsets.only(right:50.0),
                        child: Text(
                          '       Time',
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:40.0),
                        child: Text(
                          'Sp1',
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:35.0),
                        child: Text(
                          'Sp2',
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.grey.withOpacity(0.8)),
                        ),
                      ),
                      Text(
                        'Sp3',
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
                  future: mongoDB.getData_quantity(),
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
                            return displayCard(MongoDbModel_quantity.fromJson(
                                snapshot.data[index]));
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

  Widget displayCard(MongoDbModel_quantity data) {
    return Table(
      columnWidths: {
        0: FixedColumnWidth(70),
        1: FixedColumnWidth(30),
        2: FixedColumnWidth(30),
        3: FixedColumnWidth(30),
        4: FixedColumnWidth(20),
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
                padding: const EdgeInsets.all(8.0),
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
                  '${data.Sp1}',
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
                  '${data.Sp2}',
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
                  '${data.Sp3}',
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
                      await mongoDB.delete_Quantity(data);
                      setState(() {});
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
