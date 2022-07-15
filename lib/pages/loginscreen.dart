import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/signup_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginScreen createState() => LoginScreen();

  Future login(BuildContext cont) async {
    if (username.text == '' || password.text == '') {
      Fluttertoast.showToast(
          msg: "Username and Password cannot be blank!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 15.0);
    } else {
      var url = "http://192.168.0.110/localconnect/login.php";
      var response = await http.post(Uri.parse(url),
          body: {"username": username.text, "password": password.text});
      var data = jsonDecode(response.body);

      if (data == "success") {
        Navigator.push(
            cont, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        Fluttertoast.showToast(msg: "Invalid Username or Password.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 15.0
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.jpg",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: Icon(Icons.person),
                        hintText: "Enter Username",
                        labelText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: Icon(Icons.lock),
                        prefixIconColor: Colors.deepPurple,
                        hintText: "Enter Password",
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                      onPressed: () => login(context),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 25),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                          onPrimary: Colors.white,
                          side: BorderSide(color: Colors.deepPurple, width: 2),
                          minimumSize: Size(80, 40)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


