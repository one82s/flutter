import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        title: 'Simple Intereset Calculator',
        home: SIForm(),
      ));
}

class SIForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }

}

class _SIFormState extends State<SIForm>{
  var _currencies = ['Peso', 'Dollar', 'Euro', 'Yen'];
  final _minimumPadding = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Intereset Calculator')
      ),
      body:Container(
        margin:EdgeInsets.all(_minimumPadding*2),
        child:Column(
          children: [
            getImageAsset(),
          ],
        )

      )
    );
  }

  Widget getImageAsset(){
    AssetImage assetImage = AssetImage('images/bank_icon.png');
    Image image = Image(image:assetImage, width: 125.0, height: 125.0);
    return Container(child: image, margin: EdgeInsets.all(_minimumPadding*10));

  }

}
