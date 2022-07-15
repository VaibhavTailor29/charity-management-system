import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'donator.dart';

Future<List<Donator>> fetchDonator() async {
  String url = "http://192.168.150.16/localconnect/donator.php";

  final response = await http.get(Uri.parse(url));
  return DonatorFromJson(response.body);
}

class DonatorInformation extends StatelessWidget {
  // const DonatorInformation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donator List"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: FutureBuilder(
              future: fetchDonator(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Donator donator = snapshot.data[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget> [
                              Text('Name : ${donator.name}',style: TextStyle(fontSize: 20, color: Colors.redAccent),),
                              Text('Email ID : ${donator.email}',style: TextStyle(fontSize: 20),),
                              Text('Mobile Number : ${donator.mobilenumber}',style: TextStyle(fontSize: 20),),
                              Text('Address : ${donator.address}',style: TextStyle(fontSize: 20),),
                              Text('Donated Item : ${donator.item}',style: TextStyle(fontSize: 20),),
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
