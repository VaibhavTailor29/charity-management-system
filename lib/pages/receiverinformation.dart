import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'receiver.dart';

Future<List<Receiver>> fetchReceiver() async {
  String url = "http://192.168.150.16/localconnect/receiver.php";

  final response = await http.get(Uri.parse(url));
  return ReceiverFromJson(response.body);
}

class Receiverinformation extends StatelessWidget {
  // const R({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receiver List"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: FutureBuilder(
              future: fetchReceiver(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Receiver receiver = snapshot.data[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget> [
                              Text('Name : ${receiver.name}',style: TextStyle(fontSize: 20, color: Colors.redAccent),),
                              Text('Email ID : ${receiver.email}',style: TextStyle(fontSize: 20),),
                              Text('Mobile Number : ${receiver.mobilenumber}',style: TextStyle(fontSize: 20),),
                              Text('Address : ${receiver.address}',style: TextStyle(fontSize: 20),),
                              Text('Received Item : ${receiver.item}',style: TextStyle(fontSize: 20),),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}