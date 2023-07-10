import 'package:flutter/material.dart';

class PassengerDetailsPage extends StatelessWidget {
  final String passengerName;

  const PassengerDetailsPage({required this.passengerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passenger Details'),
      ),
      body: Center(
        child: Text(
          'Passenger Name: $passengerName',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}