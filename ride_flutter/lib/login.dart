import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ride_flutter/main.dart';
import 'package:ride_flutter/register.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login>{

  final _usertextController = TextEditingController();
  final _passwordtextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0F2027),
                    Color(0xFF203A43),
                    Color(0xFF2C5364),
                  ])
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              Image.asset('assets/images/logo.png',
              height: 100,),
              SizedBox(height: 20,),
              Text('Login Page',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 420,
                width: 325,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10,),
                    Text('Please Login to Your Account',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _usertextController,
                        decoration: InputDecoration(
                            labelText: 'Email'
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _passwordtextController,
                        decoration: InputDecoration(
                            labelText: 'Password'
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ElevatedButton(
                          child: const Text('Login',
                          ),
                          onPressed: () async {
                            print("---------g---gg--");
                            var url = "http://10.0.2.2:8000/api/users/login";
                            final response = await http.post(Uri.parse(url),headers: {'Content-Type': 'application/json'}, body: json.encode({
                              "username": _usertextController.text,
                              "password": _passwordtextController.text
                            }));
                            print(json.decode(response.body));
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RideShareHeader()));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.yellow,
                              foregroundColor: Colors.black
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: TextButton(
                          child: const Text('Need to Register',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Register()));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
