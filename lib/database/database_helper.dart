import 'dart:async';
import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:path_provider/path_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "MyDataBase.db";
  static final _databaseVersion = 1;
  static final table = "my_table";

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    score INTEGER NOT NULL
    )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $table"));
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row["id"];
    return await db.update(table, row, where: "id = ?", whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: "id = ?", whereArgs: [id]);
  }
}
