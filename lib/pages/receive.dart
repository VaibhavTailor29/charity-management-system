import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class receive extends StatefulWidget {
  // const receive({ Key? key }) : super(key: key);

  @override
  _receiveState createState() => _receiveState();
}

class _receiveState extends State<receive> {
  final items = ['Money', 'Food', 'Clothes', 'Other items'];
  String? value;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final maskFormatter = MaskTextInputFormatter(mask: '+91 ##### #####');


  final TextEditingController _textEditingController =
      new TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController item = TextEditingController();

  Future receive(BuildContext cont) async {
    if (name.text == "" || email.text == "" || address.text == "" || mobilenumber.text== "" || item.text == "") {
      Fluttertoast.showToast(
          msg: "All Field cannot be blank!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16.0);
    } else {
      var url = "http://192.168.150.16/localconnect/receive.php";
      var respone = await http.post(Uri.parse(url), body: {
        "name": name.text,
        "email": email.text,
        "mobilenumber": mobilenumber.text,
        "address": address.text,
        "item": item.text
      });

      var data = json.decode(respone.body);

      if (data == "success") {
        Fluttertoast.showToast(
            msg: "Received Successful!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Received Unsuccessful!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text(
          'RECEIVE',
          // style: TextStyle(color: Colors.deepPurple),
        ),
         centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Personal Information",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                  Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name"),
                      TextFormField(
                        controller: name,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return "Enter Correct name";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          // labelText: "Name",
                          hintText: "Enter your name",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Email Address"),
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                  .hasMatch(value)) {
                            return "Enter Correct name";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your email address"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Mobile Number"),
                      TextFormField(
                        controller: mobilenumber,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'/((\+*)((0[ -]*)*|((91 )*))((\d{12})+|(\d{10})+))|\d{5}([- ]*)\d{6}/')
                                  .hasMatch(value)) {
                            return "Enter Correct name";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your mobile number",
                        ),
                        inputFormatters: [maskFormatter],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Address"),
                      TextFormField(
                        controller: address,
                        maxLength: 100,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your address"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("What would you like to Receive?"),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Colors.deepPurple, width: 2),
                        ),
                        child: DropdownButton<String>(
                          value: value,
                          isExpanded: true,
                          items: items.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(
                            () => this.value = value,
                          ),
                        ),
                      ),

                         SizedBox(
                        height: 20,
                      ),
                      Text("What would you like to receive?"),
                        TextFormField(
                          controller: item,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter your Receive item name"),
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(0),
                        child: ElevatedButton(
                            // style: OutlinedButton.styleFrom(
                            //     minimumSize: Size(80, 20)),
                            style: ButtonStyle(overlayColor:
                            getColor(Colors.white, Colors.teal)
                            ),
                            child: Text('Receive'),
                            // onPressed: () {
                            //   Fluttertoast.showToast(
                            //       msg: "Recieve Successfully");

                              // SnackBar(
                              //   content: Text("Donation Successful"),
                              // );}

                        onPressed: ()=>receive(context),
                        ),
                      )
                    ],
                  )),

                  // TextFormField(
                  //   decoration: InputDecoration(
                  //   hintText: "Enter your name",
                  //   labelText: "Name"
                  // ),
                  // )
                ],
              )),
        ),
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      );

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }
}