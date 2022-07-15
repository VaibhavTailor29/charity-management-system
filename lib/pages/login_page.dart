import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/signup_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login(BuildContext cont) async {
    if (username.text == '' || password.text == '') {
      Fluttertoast.showToast(
          msg: "Username and Password cannot be blank!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 15.0);
    } else {
      var url = "http://192.168.150.16/localconnect/login.php";
      var response = await http.post(Uri.parse(url) ,
          body: {"username": username.text, "password": password.text});

      var data = jsonDecode(response.body);

      if (data == "success") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
  
      }
      
      else {
        Fluttertoast.showToast(
            msg: "Invalid Username or Password.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 15.0);
      }
    }
    
  }

  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  Future moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.jpg",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 25.0),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
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
                      height: 40.0,
                    ),

                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        // onTap: () => moveToHome(context),
                        onTap: () => login(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                          // decoration: BoxDecoration(
                          //     color: Colors.deepPurple,
                          //     borderRadius:
                          //         BorderRadius.circular(changeButton ? 40 : 8)),
                        ),
                      ),
                    ),
                    // ElevatedButton(onPressed: ()=> login(context) ,child: Text("Login", style: TextStyle(fontSize: 25),),
                    //   style: ElevatedButton.styleFrom(
                    //     primary: Colors.deepPurple,
                    //     onPrimary: Colors.white,
                    //     side: BorderSide(color: Colors.deepPurple, width: 2),
                    //     minimumSize: Size(80, 40)
                    //     ),),

                    SizedBox(
                      height: 40.0,
                    ),
                    Text("Need an account?"),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpPage()));
                      },
                      title: Text(
                        "SIGN UP",
                        textScaleFactor: 1.0,
                        style: TextStyle(color: Colors.deepPurple),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // ElevatedButton(
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(
                    //     minimumSize: Size(150, 40),
                    //     backgroundColor: Colors.deepPurpleAccent,
                    //   ),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
