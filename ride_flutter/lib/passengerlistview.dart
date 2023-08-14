import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './passengerdetailspage.dart';
import 'auth.dart';

class RiderRequest{
  late String ride_id;
  late String pickup;
  late String dropoff;
  late String amount;
  late String pay_type;
  late String user_name;

  RiderRequest({
    required this.ride_id,
    required this.pickup,
    required this.dropoff,
    required this.amount,
    required this.pay_type,
    required this.user_name
  });

  factory RiderRequest.fromJson(Map<String, dynamic> json) => RiderRequest(
    ride_id: json["ride_id"],
    pickup: json["pickup"],
    dropoff: json["dropoff"],
    amount: json["amount"],
    pay_type: json["pay_type"],
    user_name: json["user_name"],
  );
}

Future<List<RiderRequest>> getRidersList() async {
  final response = await http.get(
    Uri.parse('http://10.0.2.2:8000/api/rider/request'),
  );
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("123123123");
    print(jsonResponse);
    List<RiderRequest> riders = [];
    for (var u in jsonResponse) {
      print("3333333333333333333311131");
      print(u);
      RiderRequest rider = RiderRequest(ride_id: u['ride_id'].toString(), pickup: u['from_loc'], dropoff: u['to_loc'], amount: u['price'], pay_type: u['pay_type'], user_name: u['user_id'].toString());
      riders.add(rider);
    }
    print("3333333333333333333333333");
    print(riders);
    return riders;
  } else {
    throw Exception('Failed to load post');
  }
}

class PassengerListView extends StatefulWidget {
  @override
  State<PassengerListView> createState() => _PassengerListViewState();
}
class _PassengerListViewState extends State<PassengerListView> with SingleTickerProviderStateMixin {
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
  late Future<List<RiderRequest>> riders;
  late String driver='';

  @override
  void initState() {
    super.initState();
    // Make the API call here
    print("hellooooo");
    print(riders);
  }
  //
  // Future<void> fetchData() async {
  //   try {
  //     // Replace "YOUR_API_URL" with the actual URL of your API
  //     var url = "http://localhost:8000/api/rider/request";
  //     final response = await http.get(Uri.parse(url),headers: {'Content-Type': 'application/json'});
  //     if (response.statusCode == 200) {
  //       print(json.decode(response.body));
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    print("AuthProvider, $authProvider");
    print(authProvider.token);
    if (authProvider.token != null) {
      print("hellllo121212");
      http.get(Uri.parse('http://10.0.2.2:8000/api/user'), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': authProvider.token.toString()
      }).then((response) {
        if (response.statusCode == 200) {
          final responseData = response.body;
          final result = json.decode(responseData);

          print("1111111111111111111111");
          print(responseData);
          print(json.decode(responseData)['first_name']);
          final driver = result['first_name'];
          // Do something with the response data
        } else {
          print('Request failed with status: ${response.statusCode}');
        }
      }).catchError((error) {
        print('An error occurred: $error');
      });
      print("hhhhhhhhhhhhhhhhhhhhhhhhh");

      // if (response.statusCode == 200) {
      //   // Handle successful response
      // } else {
      //   // Handle error
      // }
      // Token is not present, handle accordingly (e.g., redirect to login)
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Details'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$driver'),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<RiderRequest>>(
            future: riders,
            builder: (context, snapshot) {
              print("dddddddddddd");
              print(snapshot);
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].pickup),
                        subtitle: Text(snapshot.data![index].dropoff),
                        trailing: Text('\$${snapshot.data![index].amount}'),
                        onTap: () {
                          // Handle the onTap event for each list item
                          // For example, navigate to a passenger details page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PassengerDetailsPage(
                                ride_id: snapshot.data![index].ride_id,
                                pickup: snapshot.data![index].pickup,
                                dropoff: snapshot.data![index].dropoff,
                                amount: snapshot.data![index].amount,
                                pay_type: snapshot.data![index].pay_type,
                                user_name: snapshot.data![index].user_name
                              ),
                            ),
                          );
                        },
                      );
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}