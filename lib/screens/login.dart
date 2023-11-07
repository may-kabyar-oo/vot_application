import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vot_application/screens/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Function to handle the login button press
  void handleLogin() async {
    final String username = usernameController.text;
    final String password = passwordController.text;

    var apiUrl = "http://127.0.0.1:8000/api/user/login";

    final response = await http.post(Uri.parse(apiUrl), body: {
      'username': username,
      'password': password,
    });

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF4EAC6),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.grey),
                //   borderRadius: BorderRadius.circular(5.0),
                // ),
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                child: Column(
                  children: [
                    Image.asset('assets/user.png'),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 45,
                          child: TextField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                              hintText: 'Username',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          height: 45,
                          child: TextField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff073557)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)))),
                onPressed: handleLogin,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
