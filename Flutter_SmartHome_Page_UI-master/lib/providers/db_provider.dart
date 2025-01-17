import 'dart:io';
import 'package:flutter_smart_home_ui/model/employee_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'videojocs_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Videojocs('
          'id INTEGER PRIMARY KEY,'
          'nom TEXT,'
          'empresa TEXT,'
          'imatge TEXT'
          ')');
    });
  }

  // Insert employee on database
  createVideojocs(Videojocs newVideojocs) async {
    await deleteAllVideojocs();
    final db = await database;
    final res = await db.insert('Videojocs', newVideojocs.toJson());

    return res;
  }

  // Delete all employees
  Future<int> deleteAllVideojocs() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Videojocs');

    return res;
  }

  Future<List<Videojocs>> getAllVideojocs() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM VIDEOJOCS");

    List<Videojocs> list =
        res.isNotEmpty ? res.map((c) => Videojocs.fromJson(c)).toList() : [];

    return list;
  }
}
