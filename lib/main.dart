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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Intereset Calculator')
      ),
      body:Column(
        children: [],
      )
    );
  }

}
