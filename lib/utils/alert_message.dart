import 'package:flutter/material.dart';

class AlertMessage{
  Future<bool> showNoticeDialog(BuildContext context, String title, String message) async{
    bool show = false;
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  (){
        show = false;
//        debugPrint('Cancel clicked and show value: $show');
        Navigator.pop(context);
      }
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () {
        show = true;
//        debugPrint('Continue clicked and show value: $show');
        Navigator.pop(context);
      }
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
        cancelButton,
      ],
    );

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
//    debugPrint('show value: $show');
    return show;
  }
}