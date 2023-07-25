import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ride_flutter/login.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<Register>{

  final _fnametextController = TextEditingController();
  final _lnametextController = TextEditingController();
  final _emailtextController = TextEditingController();
  final _passwordtextController = TextEditingController();
  final _password2textController = TextEditingController();
  final _usertypetextController = TextEditingController();
  final _phonetextController = TextEditingController();

  String dropdownvalue = 'Select';

  // List of items in our dropdown menu
  var items = [
    'Select',
    'Rider',
    'Driver',
    'Admin'
  ];

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
              Image.asset('images/logo.png',
              height: 100,
              ),
              SizedBox(height: 20,),
              Text('Register Page',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 490,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10,),
                    Text('Please Register to our Account',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _fnametextController,
                        decoration: InputDecoration(
                          labelText: 'First Name'
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _lnametextController,
                        decoration: InputDecoration(
                            labelText: 'Last Name'
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _passwordtextController,
                        decoration: InputDecoration(
                            labelText: 'Password'
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _password2textController,
                        decoration: InputDecoration(
                            labelText: 'Confirm Password'
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _phonetextController,
                        decoration: InputDecoration(
                            labelText: 'Phone Number'
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _emailtextController,
                        decoration: InputDecoration(
                            labelText: 'Email'
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DropdownButton(

                            // Initial Value
                            value: dropdownvalue,
                            isExpanded: true,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: SizedBox(
                                  width: 100,
                                  child: Text(items),
                                ),

                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              _usertypetextController.text = newValue!;
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ElevatedButton(
                          child: const Text('Register',
                          ),
                          onPressed: () async {
                            print(_fnametextController.text);
                            print(_lnametextController.text);
                            print(_passwordtextController.text);
                            print(_password2textController.text);
                            print(_emailtextController.text);
                            print(_phonetextController.text);
                            print(_usertypetextController .text);
                            var url = "http://127.0.0.1:8000/api/users/register";
                            final response = await http.post(Uri.parse(url),headers: {'Content-Type': 'application/json'}, body: json.encode({
                              "username": _emailtextController.text,
                              "password": _passwordtextController.text,
                              "password2": _password2textController.text,
                              "email": _emailtextController.text,
                              "first_name": _fnametextController.text,
                              "last_name": _lnametextController.text,
                              "user_type": _usertypetextController .text
                            }));
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Login()));
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
                          child: const Text('Need to Login',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Login()));
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
