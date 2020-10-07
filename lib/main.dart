
import "package:flutter/material.dart";

void main(){
  runApp(
      MaterialApp(
        title: "Sample Application",
        home: Scaffold(
          appBar: AppBar(title: Text("Sample App - App Bar")),
          body: Material(
              color: Colors.redAccent,
              child:
              Center(
                child:
                Text("Hello World!",
                    textDirection:TextDirection.ltr,
                    style: TextStyle(color: Colors.white, fontSize: 40.0)),
              )
          ))
      )
  );
}