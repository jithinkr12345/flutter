import 'package:flutter/material.dart';
import 'package:ride_flutter/welcome.dart';
import 'driverdetailspage.dart';
import 'package:provider/provider.dart';
import 'auth.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RoadRunner',
      theme: ThemeData(
        // Your theme data
      ),
      home: Welcome(),
      // home: RideShareHeader(),
    );
  }
}

class RideShareHeader extends StatelessWidget {
  const RideShareHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          children: [
            Container(
              height: 80.0,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Ride Share App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: null, // Replace with your onPressed logic
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 400.0, // Adjust the width as needed
              height: 600.0, // Adjust the height as needed
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.blueGrey,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CarRide',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Image.asset('assets/images/card1.jpg'), // Replace with the actual image path
                      SizedBox(height: 8.0),
                      Text(
                        'Tell us about your vehicle \n',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'To qualify you must be 21 years of age and have a vehicle that meets the following requirements:\n',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BulletSpan(text: '2013 or newer \n'),
                      BulletSpan(text: 'At least 4 doors \n'),
                      BulletSpan(text: 'Not salvaged \n'),
                      BulletSpan(text: 'Must have valid DL \n'),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        child: Text('Continue'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DriverDetailsPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BulletSpan extends StatelessWidget {
  final String text;

  const BulletSpan({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('\u2022 ', style: TextStyle(fontSize: 14.0)),
          Expanded(child: Text(text, style: TextStyle(fontSize: 14.0))),
        ],
      ),
    );
  }
}
