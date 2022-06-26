import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DbCreator {
  static const _databaseName = "Cobrador.db";
  static const _databaseVersion = 1;
  static Database? _database;

  Future<Database> get database async => _database ??= await initDatabase();
  DbCreator._privateConstructor();
  static final DbCreator instance = DbCreator._privateConstructor();

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''    
          CREATE TABLE cashflows (          
            id INTEGER PRIMARY KEY,
            personName TEXT NOT NULL, 
            type TEXT NOT NULL, 
            value REAL NOT NULL,
            date TEXT NOT NULL,
            note TEXT,
            paid INTEGER NOT NULL
          )       
          ''');

    Batch batch = db.batch();

    batch.insert('cashflows', {
      'id': 1,
      'personName': 'Korolev',
      'type': 'debt',
      'value': '1500',
      'date': '19/05/1990',
      'note': 'Higher! Faster than anyone!!!',
      'paid': 0
    });

    batch.insert('cashflows', {
      'id': 2,
      'personName': 'Jaré',
      'type': 'loan',
      'value': '3500',
      'date': '19/05/1990',
      'note': 'sem nota',
      'paid': 0
    });

    await batch.commit(noResult: true);
  }
}
