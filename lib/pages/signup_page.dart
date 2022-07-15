
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpPage extends StatelessWidget {
  // const SignUpPage({ Key? key }) : super(key: key);

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repeatpassword = TextEditingController();

  Future signup(BuildContext cont) async {
    if (username.text == "" || password.text == "" || repeatpassword.text == "") {
          Fluttertoast.showToast(
          msg: "All Field cannot be blank!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16.0);
    }
    else {

      if(password.text.length<6 || repeatpassword.text.length<6){
              Fluttertoast.showToast(
              msg: "Password length should be atleast 6",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              fontSize: 16.0);
            }
      else if (password.text == repeatpassword.text) {
            var url = "http://192.168.150.16/localconnect/signup.php";
            var response = await http.post(Uri.parse(url),
            body: {"username": username.text, "password": password.text});

            var data = json.decode(response.body);
            if(data == "success"){
              Fluttertoast.showToast(
              msg: "Registration Success!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              fontSize: 16.0);

              Navigator.push(cont, MaterialPageRoute(builder: (context)=> HomePage()));
            }
            else{
              Fluttertoast.showToast(
              msg: "Registration Failed!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              fontSize: 16.0);
            }
      }
      else{
          Fluttertoast.showToast(
          msg: "Both password have to be the same!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //   image: AssetImage("assets/images/background1.jpg"),
            //   fit: BoxFit.fill,
            //   opacity: 0.9
            //   )
            // ),
            padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(alignment: Alignment.center),
                SizedBox(
                  height: 30
                  ),
        
                Image(image: AssetImage("assets/images/welcome.png")),
                
                SizedBox(
                  height: 80
                  ),
        
                Text("Registration Form", style: TextStyle(fontSize: 30.0, color: Colors.deepPurple)),
              
                SizedBox(
                  height: 20,
                ),
        
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
                                borderRadius: BorderRadius.circular(30.0),
                                ),
                                ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
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
                            hintText: "Enter Password",
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password cannot be empty";
                              } else if (value.length < 6) {
                                return "Password length should be atleast 6";
                              }
                              return null;
                            },
                          ),
        
                      SizedBox(
                        height: 20,
                      ),
        
                      TextFormField(
                        controller: repeatpassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Enter above Password again",
                            labelText: "Enter Password again",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password cannot be empty";
                              } else if (value.length < 6) {
                                return "Password length should be atleast 6";
                              }
                              return null;
                            },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(onPressed: ()=> signup(context) ,child: Text("Register", style: TextStyle(fontSize: 25),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        onPrimary: Colors.white,
                        side: BorderSide(color: Colors.deepPurple, width: 2),
                        minimumSize: Size(80, 40)
                        ),)
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
