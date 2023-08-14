import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:ride_flutter/ridedetails.dart';

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
  final String ride_id;
  final String pickup;
  final String dropoff;
  final String amount;
  final String pay_type;
  final String user_name;

  const PassengerDetailsPage({
    required this.ride_id,
    required this.pickup,
    required this.dropoff,
    required this.amount,
    required this.pay_type,
    required this.user_name
  });

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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(8.0),
            child: Text(
              'Pick up Location: ',
              overflow: TextOverflow.fade,
            ),
            ),
            Padding(padding: EdgeInsets.all(8.0),
              child: Container(
                width: 250,
                child: Text(widget.pickup,
                  overflow: TextOverflow.fade,),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(8.0),
              child: Text('Drop Off Location: ',
                overflow: TextOverflow.fade,),
            ),
            Padding(padding: EdgeInsets.all(8.0),
              child: Container(
                width: 250,
                child: Text(widget.dropoff,
                  overflow: TextOverflow.fade,),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(8.0),
              child: Text('Amount: '),
            ),
            Padding(padding: EdgeInsets.all(8.0),
              child: Text(widget.amount),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(8.0),
              child: Text('Pay Mode: '),
            ),
            Padding(padding: EdgeInsets.all(8.0),
              child: Text(widget.pay_type),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(8.0),
              child: Text('Rider Name: '),
            ),
            Padding(padding: EdgeInsets.all(8.0),
              child: Text(widget.user_name),
            ),
          ],
        ),
        ElevatedButton(onPressed: (){
          // _trackme();
          _update_riderequest();
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MapSample(pickup: widget.pickup, dropoff: widget.dropoff)));
        }, child: Text('Accept Ride'))
      ],),);
  }
  // Future<void> _trackme()async{
  //   Timer.periodic(Duration(seconds: 3), (timer)async{
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);
  //     print("Latitude: ${position.latitude}");
  //     print("Longitude: ${position.longitude}");
  //     var url = "http://10.0.2.2:8000/api/rider/map";
  //     final response = await http.post(Uri.parse(url),headers: {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*', 'Access-Control-Allow-Methods': 'POST'}, body: json.encode({'driver_update_id': 1, 'driver_id': 1, 'longitude': position.longitude, 'latitude': position.latitude}));
  //   });
  // }

  Future<void> _update_riderequest()async{
    var update_url = "http://10.0.2.2:8000/api/rider/request";
    final update_response = await http.put(Uri.parse(update_url),headers: {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*', 'Access-Control-Allow-Methods': 'POST'}, body: json.encode({
      "ride_id": widget.ride_id,
      "amount": widget.amount,
      "pickup": widget.pickup,
      "dropoff": widget.dropoff,
      "pay_type": widget.pay_type,
      "state": "running",
      "driver_id": 1,
      "username": widget.user_name,
    }));
    print("rrrrrrrrrrrrrrrrrrr");
    print(json.decode(update_response.body));
  }
}