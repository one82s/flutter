import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Intereset Calculator',
        home: SIForm(),
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.white,
          accentColor: Colors.grey,
          hintColor: Colors.white30,
          focusColor: Colors.white
        ),
      ));
}

class SIForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
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
  final _termText = 'Term';
  final _termHintText = 'Terms in years';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Intereset Calculator')
      ),
      body:Container(
        margin:EdgeInsets.all(_minimumPadding*2),
        child:ListView(
          children: [
            getImageAsset(),
            getColumnChildWithPadding(
               getTextField(_principalText, _principalHintText)
            ),
            getColumnChildWithPadding(
               getTextField(_roiText, _roiHintText)
            ),
            getColumnChildWithPadding(
              Row(
                children: [
                  Expanded(
                    child: getTextField(_termText, _termHintText)
                  ),
                  Container(
                    width: _minimumPadding * 5
                  ),
                  Expanded(
                    child:DropdownButton(
                      items: _currencies.map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value)
                      );
                      }).toList(),
                      value: currencySelected,
                      onChanged: (String newValueSelected){

                      })
                  )
                ],
              )
            ),
            getColumnChildWithPadding(
              Row(
                children: [
                  getExpandedButtons('Calculate'),
                  Container(
                      width: _minimumPadding
                  ),
                  getExpandedButtons('Reset')
                 ]
              )
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding*2),
              child: Text('TODO: Output text here'),
            )
          ]
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

  Padding getColumnChildWithPadding(Widget widget){
    return Padding(
        padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
        child:(
            widget
        )
    );
  }

  Expanded getExpandedButtons(String buttonText){
    return Expanded(
          child: RaisedButton(
              child: Text(buttonText),
              onPressed: (){
                debugPrint('$buttonText Button was pressed');
              }
          )
    );
  }
}
