import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:firstapp/models/note.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDesc = 'description';
  String colDate = 'date';
  String colPrio = 'priority';

  DatabaseHelper.createInstance();

  factory DatabaseHelper(){
    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper.createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if(_database == null){
      _database = await initializeDb();
    }
    return _database;
  }

  Future<Database> initializeDb() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    //Open and create DB at a given path
    var notesDatabase = await openDatabase(path, version:1, onCreate: createDb);
    return notesDatabase;
  }
  void createDb(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colTitle TEXT, $colDesc TEXT, $colPrio IINTEGER, $colDate TEXT)');
  }
}