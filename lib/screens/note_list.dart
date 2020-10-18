import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firstapp/screens/note_detail.dart';
import 'package:firstapp/models/note.dart';
import 'package:firstapp/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
      updateNoteListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//          debugPrint('FAB was pressed');
          navigateToDetailPage(Note('', '', 2), 'Add Note');
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getNoteListView() {
    TextStyle titleStype = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      getPriorityColor(this.noteList[position].priority),
                  child: getPriorityIcon(this.noteList[position].priority),
                ),
                title: Text(this.noteList[position].title, style: titleStype),
                subtitle: Text(this.noteList[position].date),
                trailing: GestureDetector(
                    child: Icon(Icons.delete, color: Colors.grey),
                    onTap: () {
                      deleteNote(context, this.noteList[position]);
                    }),
                onTap: () {
//                  debugPrint('list view was tapped');
                  navigateToDetailPage(this.noteList[position], 'Edit Note');
                },
              ));
        });
  }

  void navigateToDetailPage(Note note, String appBarTitle) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, appBarTitle);
    }));
    if (result) {
      updateNoteListView();
    }
  }

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.green;
        break;
      case 3:
        return Colors.yellow;
      default:
        return Colors.green;
    }
  }

  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void deleteNote(BuildContext context, Note note) async {
    int deleted = await databaseHelper.deleteNote(note);
    if (deleted != 0) {
      showSnackBar(context, 'Note deleted sucessfully!');
      updateNoteListView();
    }
  }

  void showSnackBar(BuildContext context, String message) {
    final snackbar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void updateNoteListView() {
    final Future<Database> db = databaseHelper.initializeDb();
    db.then((value) {
      Future<List<Note>> noteListFromDb = databaseHelper.getNoteList();
      noteListFromDb.then((value) {
        setState(() {
          noteList = value;
          count = noteList.length;
        });
      });
    });
  }
}
