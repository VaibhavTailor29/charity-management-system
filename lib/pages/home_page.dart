import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/drawer.dart';
import 'package:flutter_catalog/pages/google_signin_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  // final int days = 30;
  // final String = "Vaibhav K. Tailor";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text(
          'CHARITY MANAGEMENT SYSTEM',
          // style: TextStyle(color: Colors.deepPurple),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "WELCOME TO CHARITY MANAGEMENT SYSTEM",
            style: TextStyle(
              // backgroundColor: Colors.deepPurple,
              fontSize: 20,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Image.asset("assets/images/Online_Charity.png"),
        ],
        // child: Container(
        //   child: Text("Welcome to Charity Management System"),
        // ),
      ),
      drawer: MyDrawer(),
    );
  }
}
