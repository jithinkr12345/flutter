import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

// class PassengerDetailsPage extends StatelessWidget {
//   final String passengerName;
//
//   const PassengerDetailsPage({required this.passengerName});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Passenger Details'),
//       ),
//       body: Center(
//         child: Text(
//           'Passenger Name: $passengerName',
//           style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

class PassengerDetailsPage extends StatefulWidget {
  final String passengerName;
  const PassengerDetailsPage({required this.passengerName});

  @override
  State<PassengerDetailsPage> createState() => _PassengerDetailsPageState();
}

class _PassengerDetailsPageState extends State<PassengerDetailsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passenger Details'),
      ),
      body: Column(
      children: [
        ElevatedButton(onPressed: (){
          _trackme();
        }, child: Text('Track ME'))
      ],),);
  }
  Future<void> _trackme()async{
    Timer.periodic(Duration(seconds: 3), (timer)async{
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print("Latitude: ${position.latitude}");
      print("Longitude: ${position.longitude}");
      var url = "http://127.0.0.1:8000/api/rider/map";
      final response = await http.post(Uri.parse(url),headers: {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*', 'Access-Control-Allow-Methods': 'POST', 'Authorization': 'token 2a944a92907736cb09fa35fac35b906f536a17fc'}, body: json.encode({'driver_update_id': 1, 'driver_id': 1, 'longitude': position.latitude, 'latitude': position.longitude}));

    });
  }
}