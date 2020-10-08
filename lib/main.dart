import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "List View Sample",
    home: Scaffold(
      body: getListView()
    )
  ));
}

Widget getListView(){
  var listView = ListView(
    children: [
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text("Landscapr"),
        subtitle: Text("Beautiful View"),
        trailing: Icon(Icons.wb_sunny)
      )
    ],
  );
  return listView;
}

