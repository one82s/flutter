import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  String appBarTitle = '';

  NoteDetail(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NodeDetailState(this.appBarTitle);
  }
}

class NodeDetailState extends State<NoteDetail> {
  String appBarTitle = '';

  NodeDetailState(this.appBarTitle);

  var priorities = ['High', 'Medium', 'Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return WillPopScope(
        onWillPop: (){
          moveToLastScreen();
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(appBarTitle),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
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
                      value: 'Low',
                      onChanged: (selectedValue) {
                        setState(() {
                          debugPrint('User selected $selectedValue');
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
                        debugPrint('Title entered is $textValue');
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
                        debugPrint('Description entered is $textValue');
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
                              debugPrint('Save button was pressed');
                            });
                          },
                        )),
                        Container(width: 5.0),
                        Expanded(
                            child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text('Reset', textScaleFactor: 1.5),
                          onPressed: () {
                            setState(() {
                              debugPrint('Reset button was pressed');
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

  void moveToLastScreen(){
    Navigator.pop(context);
  }
}
