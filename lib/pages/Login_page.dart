import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application/pages/Home_page.dart';
import 'package:flutter_application/services/MongoDB.dart';
import 'package:flutter_application/services/mqtt.dart';
import 'package:flutter_application/services/variables.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 6, 6),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/dca.jpg',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                //Hello again!
                SizedBox(height: 20),
                Text(
                  ' LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Color.fromARGB(255, 236, 226, 226),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'IOT SOLUTION',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 153, 140, 140),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: TextField(
                    controller: _username,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      labelText: 'UserName',
                      labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                //password
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 340,
                  height: 56,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                    ),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () async {
                      await mongoDB.findData(_username.text, _password.text);
                      setState(() {
                        Login = Login;
                      });
                      log('Login: ${Login}');
                      if ((Login == true) &&
                          (_username.text != '') &&
                          ((_password.text != ''))) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      } else {
                        showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Error!',
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: Text('Wrong username or password!'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Ok'),
                                  )
                                ],
                              );
                            });
                      }
                    },
                  ),
                ),
                Container(
                  child: FutureBuilder(
                      future: mqttSubscribe(topic: 'Run'),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Center(
                            child: Text(''),
                          );
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
