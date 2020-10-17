import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:firstapp/models/note.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDesc = 'description';
  String colDate = 'date';
  String colPrio = 'priority';

  DatabaseHelper.createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper.createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDb();
    }
    return _database;
  }

  Future<Database> initializeDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    //Open and create DB at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: createDb);
    return notesDatabase;
  }

  void createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colTitle TEXT, $colDesc TEXT, $colPrio IINTEGER, $colDate TEXT)');
  }

  Future<List<Map<String, dynamic>>> getData() async {
    Database db = await this.database;
    // native SQL query
    // var result = await db.rawQuery('SELECT * FROM $noteTable ORDER BY $colPrio ASC');
    // SQFlite query or helper function
    var result = await db.query(noteTable, orderBy: '$colPrio');
    return result;
  }

  Future<int> addNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  Future<int> updateNote(Note note) async {
    Database db = await this.database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  Future<int> deleteNote(Note note) async {
    Database db = await this.database;
    var result =
        await db.delete(noteTable, where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  Future<int> getNumberOfRecords() async {
    Database db = await this.database;
    List<Map<String, dynamic>> data = await db.query(noteTable);
    int result = Sqflite.firstIntValue(data);
    return result;
  }

  Future<List<Note>> getNoteList() async {
    var noteMapList = await getData();
    int count = noteMapList.length;
    List<Note> noteList = List<Note>();
    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }
    return noteList;
  }
}
