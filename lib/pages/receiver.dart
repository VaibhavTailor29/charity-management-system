// To parse this JSON data, do
//
//     final Receiver = ReceiverFromMap(jsonString);

import 'dart:convert';


List<Receiver> ReceiverFromJson(String str) => List<Receiver>.from(json.decode(str).map((x) => Receiver.fromMap(x)));

String ReceiverToJson(List<Receiver> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Receiver {

        String id;
        String name;
        String email;
        String mobilenumber;
        String address;
        String item;
        
    Receiver({
        required this.id,
        required this.name,
        required this.email,
        required this.mobilenumber,
        required this.address,
        required this.item,
    });

    factory Receiver.fromMap(Map<String, dynamic> json) => Receiver(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobilenumber: json["mobilenumber"],
        address: json["address"],
        item: json["item"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "mobilenumber": mobilenumber,
        "address": address,
        "item": item,
    };
}
