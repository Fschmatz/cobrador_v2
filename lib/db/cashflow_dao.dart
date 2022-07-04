import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class CashflowDao {
  static const _databaseName = "Cobrador.db";
  static const _databaseVersion = 1;

  static const table = 'cashflows';
  static const columnId = 'id';
  static const columnPersonName = 'personName';
  static const columnType = 'type';
  static const columnValue = 'value';
  static const columnDate = 'date';
  static const columnNote = 'note';
  static const columnPaid = 'paid';

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  CashflowDao._privateConstructor();

  static final CashflowDao instance = CashflowDao._privateConstructor();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path, version: _databaseVersion);
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryAllByType(String type) async {
    Database db = await instance.database;
    return await db.rawQuery('''
            SELECT * FROM $table 
            WHERE $columnType = '$type' AND $columnPaid = 0  
            GROUP BY $columnId
            ORDER BY $columnId DESC                 
    ''');
  }

  Future<List<Map<String, dynamic>>> queryAllPaid() async {
    Database db = await instance.database;
    return await db.rawQuery('''
            SELECT * FROM $table 
            WHERE $columnPaid = 1  
            GROUP BY $columnId
            ORDER BY $columnId DESC                 
    ''');
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> clearHistory() async {
    Database db = await instance.database;
    return await db.delete('$table WHERE $columnPaid = 1');
  }

}
