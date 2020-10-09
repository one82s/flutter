import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Stateful Widget App",
      home: FavoriteCity()
    )
  );
}

class FavoriteCity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State{
  String cityName = "";
  @override
  Widget build(BuildContext context) {
    debugPrint("FavoriteCity is created");
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful Widget"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onChanged: (String userInput){
                setState(() {
                  debugPrint("setState is called, tells the framework to redraw FavoriteCity widget");
                  cityName = userInput;
                });
                debugPrint("after setState is called");
              }
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "Your city name is $cityName",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
  
}