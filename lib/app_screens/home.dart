import "package:flutter/material.dart";

class Home extends StatelessWidget {
  static const fontSize = 35.0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.only(left: 10.0, top: 40.0),
            alignment: Alignment.center,
            color: Colors.redAccent,
            margin: EdgeInsets.all(50.0),
            child:Column(
              children: [
                getRow("CEB", "From Manila to Cebu"),
                getRow("PAL", "From Siargao to Manila")
              ],
            )
           )
    );
  }

  Text getText(String text, double textSize) {
    return Text(text,
        textDirection: TextDirection.ltr,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: textSize,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            color: Colors.white)
    );
  }

  Row getRow(String airline, String destination){
    return Row(
      children: [
        Expanded(
            child: getText(airline, 35.0)),
        Expanded(
            child: getText(destination, 25.0))
      ],
    );
  }
}
