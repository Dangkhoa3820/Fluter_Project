import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/Home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 6, 6),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                'Welcome back!',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 153, 140, 140),
                ),
              ),
              SizedBox(height: 45),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: TextField(
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have account? ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 187, 177, 177),
                    ),
                  ),
                  Text(
                    'Register now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              )
              //register
            ],
          ),
        ),
      ),
    );
  }
}