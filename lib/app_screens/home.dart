import "package:flutter/material.dart";

class Home extends StatelessWidget {
  static const topMargin = 30.0;
  static const fontFamily = 'Raleway';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.only(left: 10.0, top: 40.0),
            alignment: Alignment.center,
            color: Colors.white,
//            margin: EdgeInsets.all(50.0),
            child:Column(
              children: [
                getRow("CEB", "From Manila to Cebu"),
                getRow("PAL", "From Siargao to Manila"),
                FlightImageAsset(),
                FlightBookButton()
              ],
            )
           )
    );
  }

  Text getText(String text, double textSize, Color textColor, FontWeight weight) {
    return Text(text,
        textDirection: TextDirection.ltr,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: textSize,
            fontFamily: fontFamily,
            fontWeight: weight,
            fontStyle: FontStyle.normal,
            color: textColor)
    );
  }

  Row getRow(String airline, String destination){
    return Row(
      children: [
        Expanded(
            child: getText(airline, 30.0, Colors.lightBlue, FontWeight.w700)),
        Expanded(
            child: getText(destination, 20.0, Colors.lightBlue,FontWeight.w700))
      ],
    );
  }

}
class FlightImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/flight_icon.png');
    Image image = Image(image: assetImage, width: 150.0,height: 150.0);
    return Container(
        margin: EdgeInsets.only(top: Home.topMargin),
        child: image);
  }
}

class FlightBookButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Home home = Home();
    return Container(
      margin: EdgeInsets.only(top: Home.topMargin),
      width: 250.0,
      height:50.0,
      child: RaisedButton(
        color: Colors.lightBlue,
        child: home.getText("Book your flight", 20.0, Colors.white, FontWeight.w300),
        elevation: 6.0,
        onPressed: ()=> bookFlight(context)
      )
    );
  }

  void bookFlight(BuildContext context){
    var alertDialog = AlertDialog(
      title: Text("Flight booked successfully!"),
      content: Text("Have a pleasant flight."),
    );

    showDialog(
      context:context,
      builder: (BuildContext context)=> alertDialog
    );
  }
}
