import 'package:flutter/material.dart';
import 'package:firstapp/src/utils/commons.dart';


class SmallButton extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color fgColor;

  SmallButton(this.icon, this.bgColor, this.fgColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: grey,
              offset: Offset(2,1),
              blurRadius: 3
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, size: 16, color: fgColor,),
        ),
      ),
    );
  }
}
