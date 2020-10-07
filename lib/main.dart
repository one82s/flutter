import "package:flutter/material.dart";

import 'app_screens/home.dart';

void main()=> runApp(FlightWidget());

class FlightWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flight Booking Application",
      home:Home()
    );
  }

}

