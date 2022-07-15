
import 'package:flutter/material.dart';
import 'package:flutter_catalog/model/donor.dart';
import 'package:flutter_catalog/pages/receive.dart';
import 'package:sqflite/sqflite.dart';

class DonorDatabase {
  static final DonorDatabase instance = DonorDatabase._init();

  static Database? _database;

  DonorDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('donor.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $tableDonor(
        ${DonorFields.id} $idType,
        ${DonorFields.name} $textType,
        ${DonorFields.email} $textType,
        ${DonorFields.mobilenumber} $integerType,
        ${DonorFields.address} $textType,
        ${DonorFields.donateditem} $textType,
        ${DonorFields.time} $textType
      )
    ''');
  }

  Future<Donor> create(Donor Donor) async {
    final db = await instance.database;

    // final json = Donor.toJson();
    // final Columns =
    //     '${DonorFields.name},${DonorFields.email},${DonorFields.mobilenumber},${DonorFields.address},${DonorFields.donateditem},${DonorFields.time}';

    // final values =
    //     '${json[DonorFields.name]},${json[DonorFields.email]},${json[DonorFields.mobilenumber]},${json[DonorFields.address]},${json[DonorFields.donateditem]},${json[DonorFields.time]}';
    // final id = await db
    //     .rawInsert('INSRET INTO table_name ($Columns) VALUES ($values)');
    final id = await db.insert(tableDonor, Donor.toJson());
    return Donor.copy(id: id);
  }

  Future<Donor> readDonor(int id) async {
    final db = await instance.database;

    final maps = await db.query(tableDonor,
        columns: DonorFields.values,
        where: '${DonorFields.id}=?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Donor.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Donor>> readAllDonors() async {
    final db = await instance.database;

    final orderBy = '${DonorFields.time} ASC';

    // final result = await db.rawQuery('SELECT * FROM $tableDonor ORDER BY $orderBy');
    final result = await db.query(tableDonor, orderBy: orderBy);

    return result.map((json) => Donor.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

join(String dbPath, String filepath) {
  return dbPath + filepath;
}
