import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PatientList extends StatefulWidget {
  const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  List patientListData = [];
  late ScrollController controller;
  @override
  void initState() {
    controller = new ScrollController();
    getPatientList();
    super.initState();
    // getCollectionsByRider(reset: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff073557),
        iconTheme: const IconThemeData(color: Color.fromRGBO(0, 0, 0, 1)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: const Text('Vot Patient List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: _getListingView(),
      ),
    );
  }

  Widget _getListingView() {
    return ListView.separated(
        controller: controller,
        itemBuilder: (context, index) {
          var patient = patientListData[index];
          return Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(231, 238, 241, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 7,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        '-',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          "${patient['name']}",
                          style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Sex',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        '-',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          "${patient['sex']}",
                          style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Age',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        '-',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          "${patient['age']}",
                          style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        '-',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          "${patient['address']}",
                          style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Registration Date',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        '-',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          "${patient['registration_date']}",
                          style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Treatment Start Date',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        '-',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          "${patient['treatment_start_date']}",
                          style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 10.0,
          );
        },
        itemCount: patientListData.length);
  }

  //for api
  Future<void> getPatientList() async {
    var apiUrl = "http://127.0.0.1:8000/api/patients";

    final response = await http.get(
      Uri.parse(apiUrl),
    );
    // print('get collection successfully');

    final data = json.decode(response.body);

    final statusCode = response.statusCode;
    if (statusCode == 200) {
      List patientList = data["data"] as List;

      setState(() {
        patientListData = patientList;
      });
    }
  }
}
