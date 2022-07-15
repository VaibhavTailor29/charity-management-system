final String tableDonor = 'donor';

class DonorFields {
  static final List<String> values = [
    id,
    name,
    email,
    mobilenumber,
    address,
    donateditem,
    time
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String email = 'email';
  static final String mobilenumber = 'mobilenumber';
  static final String address = 'address';
  static final String donateditem = 'donateditem';
  static final String time = 'time';
}

class Donor {
  final int? id;
  final String name;
  final String email;
  final num mobilenumber;
  final String address;
  final String donateditem;
  final DateTime createdtime;

  const Donor(
      {this.id,
      required this.name,
      required this.email,
      required this.mobilenumber,
      required this.address,
      required this.donateditem,
      required this.createdtime});

  Donor copy(
          {int? id,
          String? name,
          String? email,
          int? mobilenumber,
          String? address,
          String? donateditem,
          DateTime? createdtime}) =>
      Donor(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          mobilenumber: mobilenumber ?? this.mobilenumber,
          address: address ?? this.address,
          donateditem: donateditem ?? this.donateditem,
          createdtime: createdtime ?? this.createdtime);

  static Donor fromJson(Map<String, Object?> json) => Donor(
    id: json[DonorFields.id] as int?,
    name: json[DonorFields.name] as String,
    email: json[DonorFields.email] as String,
    mobilenumber: json[DonorFields.mobilenumber] as int,
    address: json[DonorFields.address] as String,
    donateditem: json[DonorFields.donateditem] as String,
    createdtime: DateTime.parse(json[DonorFields.time] as String)
  );

  Map<String, Object?> toJson() => {
        DonorFields.id: id,
        DonorFields.name: name,
        DonorFields.email: email,
        DonorFields.mobilenumber: mobilenumber,
        DonorFields.address: address,
        DonorFields.donateditem: donateditem,
        DonorFields.time: createdtime.toIso8601String()
      };
}
