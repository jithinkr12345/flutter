import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:ride_flutter/passengerlistview.dart';
import 'package:http/http.dart' as http;


class DriverDetailsPage extends StatelessWidget {
  final List<String> dropdownItems = ['Upload your photo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Details'),
      ),
      body: SingleChildScrollView(
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
                      'Ride Share App \n',
                      style: TextStyle(
                        color: Colors.blueGrey,
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
              width: 400.0,
              height: 600.0,
              child: Card(
                shape: RoundedRectangleBorder( //<-- SEE HERE
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
                        'CarRide \n',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Welcome User \n',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Required Step \n',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Here\'s what you need to do to set up your account \n',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      DropdownButton<String>(
                        items: dropdownItems.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          // Handle dropdown value change
                        },
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        child: Text('Upload Photo'),
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles();

                          if (result != null) {
                            PlatformFile file = result.files.first;

                            List<File> files = result.files.cast<File>();
                            // Uncomment this code when connect with database

                            //   for (var file in files) {
                          //     String fileName = file.name;
                          //     // String filePath = file.path;
                          //     // int fileSize = file.size;
                          //     // String fileExtension = file.extension;
                          //
                          //     // Add your logic to upload the file to the server or perform any other operations
                          //   }
                          //   else
                          //   {
                          //   // User canceled the file picker
                          // }
                        }
                        }
                       ),

                      SizedBox(height: 16.0),
                      ElevatedButton(
                          child: Text('Upload Drivers License'),
                          onPressed: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles();

                            if (result != null) {
                              PlatformFile file = result.files.first;

                              List<File> files = result.files.cast<File>();
                              // Uncomment this code when connect with database

                              //   for (var file in files) {
                            //     String fileName = file.name;
                            //     String filePath = file.path;
                            //     int fileSize = file.size;
                            //     String fileExtension = file.extension;
                            //
                            //     // Add your logic to upload the file to the server or perform any other operations
                            //   }
                            // else
                            // {
                            //   // User canceled the file picker
                            // }
                          }
                            }
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                          child: Text('Upload Vehicle Insurance'),
                          onPressed: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles();

                            if (result != null) {
                              PlatformFile file = result.files.first;

                              List<File> files = result.files.cast<File>();
                              // Uncomment this code when connect with database

                            //   for (var file in files) {
                            //     String fileName = file.name;
                            //     String filePath = file.path;
                            //     int fileSize = file.size;
                            //     String fileExtension = file.extension;
                            //
                            //     // Add your logic to upload the file to the server or perform any other operations
                            //   }
                            // else
                            // {
                            //   // User canceled the file picker
                            // }
                          }
                            }
                      ),

                      SizedBox(height: 16.0),
                      ElevatedButton(
                        child: Text('Continue'),
                        onPressed: ()
                        {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PassengerListView(),
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
