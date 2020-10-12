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
  var currencySelected = 'Peso';
  final _minimumPadding = 5.0;
  final _principalText = 'Principal';
  final _principalHintText = 'Enter Principal e.g. 1200';
  final _roiText = 'Rate of Interest';
  final _roiHintText = 'In percent';

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
            getTextFieldColumnChild(
              getTextField(_principalText, _principalHintText)
            ),
            getTextFieldColumnChild(
              getTextField(_roiText, _roiHintText)
            )
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

  TextField getTextField(String labelText, String hintText){
    return   TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_minimumPadding),
        ),
      ),
    );
  }

  Padding getTextFieldColumnChild(TextField textField){
    return Padding(
        padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
        child:(
            textField
        )
    );
  }
}
