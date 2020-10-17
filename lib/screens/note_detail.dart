import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firstapp/models/note.dart';
import 'package:firstapp/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NodeDetailState(note, this.appBarTitle);
  }
}

class NodeDetailState extends State<NoteDetail> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  String appBarTitle;
  Note note;

  NodeDetailState(this.note, this.appBarTitle);

  var priorities = ['High', 'Medium', 'Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    titleController.text = note.title;
    descriptionController.text = note.description;
    return WillPopScope(
        onWillPop: () {
          moveToLastScreen();
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(appBarTitle),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  moveToLastScreen();
                },
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: ListView(
                children: [
                  ListTile(
                    title: DropdownButton(
                      items: priorities.map((String dropDownItems) {
                        return DropdownMenuItem<String>(
                          value: dropDownItems,
                          child: Text(dropDownItems),
                        );
                      }).toList(),
                      style: textStyle,
                      value: getPriorityAsString(note.priority),
                      onChanged: (selectedValue) {
                        setState(() {
                          debugPrint('User selected $selectedValue');
                          updatePriorityAsInt(selectedValue);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextField(
                      controller: titleController,
                      style: textStyle,
                      onChanged: (textValue) {
//                        debugPrint('Title entered is $textValue');
                        updateTitle();
                      },
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextField(
                      controller: descriptionController,
                      style: textStyle,
                      onChanged: (textValue) {
//                        debugPrint('Description entered is $textValue');
                        updateDescription();
                      },
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text('Save', textScaleFactor: 1.5),
                          onPressed: () {
                            setState(() {
//                              debugPrint('Save button was pressed');
                              saveNote();
                            });
                          },
                        )),
                        Container(width: 5.0),
                        Expanded(
                            child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text('Delete', textScaleFactor: 1.5),
                          onPressed: () {
                            setState(() {
                              debugPrint('Reset button was pressed');
                              deleteNote();
                            });
                          },
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  Widget getNoteDetailView() {
    return null;
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Medium':
        note.priority = 2;
        break;
      case 'Low':
        note.priority = 3;
        break;
      default:
        break;
    }
  }

  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = priorities[0];
        break;
      case 2:
        priority = priorities[1];
        break;
      case 3:
        priority = priorities[2];
        break;
      default:
        break;
    }
    return priority;
  }

  void updateTitle() {
    note.title = titleController.text;
  }

  void updateDescription() {
    note.description = descriptionController.text;
  }

  void saveNote() async {
    moveToLastScreen();
    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (note.id != null) {
      result = await databaseHelper.updateNote(note);
    } else {
      result = await databaseHelper.addNote(note);
    }

    if (result != 0) {
      showAlertDialog('Status', 'Note saved successgully!');
    } else {
      showAlertDialog('Status', 'Problem saving note');
    }
  }

  void deleteNote() async {
    moveToLastScreen();

    if (note.id == null) {
      showAlertDialog('Status', 'No Note deleted');
      return;
    }

    int result = await databaseHelper.deleteNote(note);
    if (result != 0) {
      showAlertDialog('Status', 'Note deleted successgully!');
    } else {
      showAlertDialog('Status', 'Problem deleting note');
    }
  }

  void showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
