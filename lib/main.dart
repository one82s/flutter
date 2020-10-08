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
        title: Text("Landscape"),
        subtitle: Text("Beautiful View"),
        trailing: Icon(Icons.wb_sunny),
        onTap: (){
          debugPrint("Landscape was tapped");
        }
      ),
      ListTile(
          leading: Icon(Icons.laptop_chromebook),
          title: Text("Work"),
          onTap: (){
            debugPrint("Work was tapped");
          }
      ),
      ListTile(
          leading: Icon(Icons.phone),
          title: Text("Contact"),
          onTap: (){
            debugPrint("Contact was tapped");
          }
      )
    ],
  );
  return listView;
}

