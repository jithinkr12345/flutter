import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DriverDetailsPage extends StatelessWidget {
  final List<String> dropdownItems = ['Upload your photo'];

  @override
  Widget build(BuildContext context) {
    // Rest of your existing code...

    return Scaffold(
      // Your existing code...
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Your existing code...
            Container(
              width: 400.0,
              height: 600.0,
              child: Card(
                // Your existing code...
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Your existing code...
                      TextFormField(
                        decoration: InputDecoration(labelText: 'First Name'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Last Name'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Age'),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Date of Birth (DOB)'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Phone'),
                        keyboardType: TextInputType.phone,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'License Number'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Car Year'),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Car Model'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Car Name'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Car Number'),
                      ),
                      // Your existing code...
                      ElevatedButton(
                        child: Text('Upload Photo'),
                        onPressed: () async {
                          // Your existing code...
                        },
                      ),
                      ElevatedButton(
                        child: Text('Upload Drivers License'),
                        onPressed: () async {
                          // Your existing code...
                        },
                      ),
                      ElevatedButton(
                        child: Text('Upload Vehicle Insurance'),
                        onPressed: () async {
                          // Your existing code...
                        },
                      ),
                      ElevatedButton(
                        child: Text('Continue'),
                        onPressed: () {
                          // Your existing code...
                        },
                      ),
                      // Your existing code...
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
