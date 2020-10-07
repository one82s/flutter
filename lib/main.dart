import "package:flutter/material.dart";
import 'app_screens/first_screen.dart';

void main()=> runApp(new SampleApp());

class SampleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "Sample Application",
        home: Scaffold(
            appBar: AppBar(title: Text("Sample App - App Bar")),
            body:FirstScreen())
    );
  }

}