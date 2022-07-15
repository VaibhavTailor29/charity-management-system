// To parse this JSON data, do
//
//     final Donator = DonatorFromMap(jsonString);

import 'dart:convert';


List<Donator> DonatorFromJson(String str) => List<Donator>.from(json.decode(str).map((x) => Donator.fromMap(x)));

String DonatorToJson(List<Donator> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Donator {

        String id;
        String name;
        String email;
        String mobilenumber;
        String address;
        String item;
        
    Donator({
        required this.id,
        required this.name,
        required this.email,
        required this.mobilenumber,
        required this.address,
        required this.item,
    });

    factory Donator.fromMap(Map<String, dynamic> json) => Donator(
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
