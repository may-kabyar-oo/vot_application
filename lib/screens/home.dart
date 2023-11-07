import 'package:flutter/material.dart';
import 'package:vot_application/screens/patient_list.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedStatus = 'Successful'; // Initial dropdown value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff073557),
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xff073557)),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PatientList(),
                ));
              },
              child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Patient Information')),
            ),
            const SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      Colors.grey, // You can change the border color as needed
                  width: 1.0, // You can change the border width as needed
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding:
                  const EdgeInsets.all(20.0), // Add padding to the container
              child: Column(
                children: [
                  const Text('VOT status'),
                  const SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors
                            .grey, // You can change the border color as needed
                        width: 1.0, // You can change the border width as needed
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        value: selectedStatus,
                        items: <String>['Successful', 'Unsuccessful']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedStatus = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff073557)),
                    ),
                    onPressed: () {
                      // Handle the submit button action
                      if (selectedStatus == 'Successful') {
                        // Handle Successful case
                      } else if (selectedStatus == 'Unsuccessful') {
                        // Handle Unsuccessful case
                      }
                    },
                    child: const Padding(
                        padding: EdgeInsets.all(10.0), child: Text('Submit')),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xff073557)),
              ),
              onPressed: () {},
              child: const Padding(
                  padding: EdgeInsets.all(10.0), child: Text('Report')),
            ),
          ],
        ),
      ),
    );
  }
}
