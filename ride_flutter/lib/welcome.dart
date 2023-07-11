import 'package:flutter/material.dart';
import 'package:ride_flutter/login.dart';
import 'package:ride_flutter/register.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

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
              SizedBox(height: 80,),
              Image.asset('images/logo.png'),
              SizedBox(height: 25,),
              Text('Welcome to RoadRunner',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 354,
                width: 325,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 230,),
                    Expanded(
                        child: Center(
                          child: ElevatedButton(
                            child: const Text('Login',
                            ),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Login()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.yellow,
                              foregroundColor: Colors.black
                            ),
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
