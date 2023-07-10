import 'package:flutter/material.dart';
import './passengerdetailspage.dart';

class PassengerListView extends StatelessWidget {
  final List<String> passengerList = [
    '01/08 12:00  Priyanka   501 GreenBrook Dr   25',
    '02/18 13:00  Libron   173 King Street  24',
    '02/28 14:00  Sameer   08 Richmond Hill  30',
    '03/01 15:00  Divyani  125 Greenbrook Dr  15',
    '04/12 22:00  Nikhil   125 Greenbrook DR  18',
    '05/15 11:00  Rajal   Victoria Hill  10',
    '06/20 10:00  Deepika  Regina St  12',
    '07/22 09:00  Nupur  173 King Street  13',
    '08/25 07:00  Jitin  Westmount Village  24',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Details'),
      ),
      body: ListView.builder(

        itemCount: passengerList.length,
        itemBuilder: (context, index) {
          String passengerName = passengerList[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(passengerName),
            subtitle: Text('Passenger Details'),
            onTap: () {
              // Handle the onTap event for each list item
              // For example, navigate to a passenger details page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PassengerDetailsPage(
                    passengerName: passengerName,
                  ),
                ),
              );
            },
          );
        },

      ),
    );
  }
}