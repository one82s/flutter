import "package:flutter/material.dart";

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.redAccent,
        child:getText()
    );
  }

  Text getText(){
    return Text("Flight", textDirection: TextDirection.ltr);
  }

}