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
  var _currencies = ['Pesos', 'Dollars', 'Euros', 'Yen'];
  var currencySelected = '';
  final _minimumPadding = 5.0;
  final _principalText = 'Principal';
  final _principalHintText = 'Enter Principal e.g. 1200';
  final _roiText = 'Rate of Interest';
  final _roiHintText = 'In percent';
  final _termText = 'Term';
  final _termHintText = 'Terms in years';
  TextEditingController _principalController = TextEditingController();
  TextEditingController _roiController = TextEditingController();
  TextEditingController _termController = TextEditingController();
  String calculationMessage = '';

  @override
  void initState() {
    super.initState();
    this.currencySelected = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Intereset Calculator')
      ),
      body:Form(
        child:Padding(
          padding:EdgeInsets.all(_minimumPadding*2),
          child:ListView(
            children: [
              getImageAsset(),
              getColumnChildWithPadding(
                 getTextField(_principalText, _principalHintText, _principalController)
              ),
              getColumnChildWithPadding(
                 getTextField(_roiText, _roiHintText, _roiController)
              ),
              getColumnChildWithPadding(
                Row(
                  children: [
                    Expanded(
                      child: getTextField(_termText, _termHintText, _termController)
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
                          _onDropdownItemSelected(newValueSelected);
                        })
                    )
                  ],
                )
              ),
              getColumnChildWithPadding(
                Row(
                  children: [
                    getExpandedButtons('Calculate', true),
                    Container(
                        width: _minimumPadding
                    ),
                    getExpandedButtons('Reset', false)
                   ]
                )
              ),
              Padding(
                padding: EdgeInsets.all(_minimumPadding*2),
                child: Text(this.calculationMessage),
              )
            ]
          )
        )

      )
    );
  }

  Widget getImageAsset(){
    AssetImage assetImage = AssetImage('images/bank_icon.png');
    Image image = Image(image:assetImage, width: 125.0, height: 125.0);
    return Container(child: image, margin: EdgeInsets.all(_minimumPadding*10));

  }

  TextField getTextField(String labelText, String hintText, TextEditingController textController){
    return   TextField(
      keyboardType: TextInputType.number,
      controller: textController,
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

  Expanded getExpandedButtons(String buttonText, bool isCalculate){
    return Expanded(
          child: RaisedButton(
              child: Text(buttonText),
              onPressed: (){
//                debugPrint('$buttonText Button was pressed');
                setState((){
                  if(isCalculate){
                    this.calculationMessage = _calculateTotalAmount();
                  }
                  else{
                    _reset();
                  }
                });
              }
          )
    );
  }

  void _onDropdownItemSelected(String newValueSelected){
    setState(() => this.currencySelected = newValueSelected);
  }

  String _calculateTotalAmount (){
      double principal = double.parse(_principalController.text);
      double roi = double.parse(_roiController.text);
      double term = double.parse(_termController.text);
      double totalAmount = principal + (principal*roi*term)/100;
    return "Your total investment is $totalAmount $currencySelected";
  }

  void _reset(){
    this._principalController.text = '';
    this._roiController.text = '';
    this._termController.text = '';
    this.currencySelected = _currencies[0];
    this.calculationMessage = '';
  }
}
