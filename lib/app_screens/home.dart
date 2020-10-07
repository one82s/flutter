import "package:flutter/material.dart";

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
          alignment: Alignment.center,
          color: Colors.redAccent,
          width:200.0,
          height: 100.0,
          child:getText()
      )
    );
  }

  Text getText(){
    return Text("Flight", textDirection: TextDirection.ltr
    );
  }

}