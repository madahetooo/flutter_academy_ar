import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "MyTodos.db";
  static final _databaseVersion = 1;
  static final table = 'my_table';
  static final columnId = 'id';
  static final columnName = 'todo';
  static Database? _database;

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table(
          $columnId INTEGER PRIMARY KEY,
          $columnName TEXT NOT NULL
          );
          ''');
  }
  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int?> insert(Map<String, dynamic> todo) async {
    Database? db = await instance.database;
    return await db?.insert(table, todo);
  }
  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int?> delete(int id) async {
    Database? db = await instance.database;
    return await db?.delete(table, where: "id = ?", whereArgs: [id]);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>?> queryAllTodos() async {
    Database? db = await instance.database;
    return await db?.query(table);
  }
}
