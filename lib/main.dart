
import "package:flutter/material.dart";

void main(){
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
    );
  }

}