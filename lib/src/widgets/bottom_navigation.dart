import 'package:firstapp/src/utils/commons.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class BottomNavigation extends StatelessWidget {
  final IconData icon;
  final String name;

  const BottomNavigation({Key key, this.icon, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon, color: white, size: 20.0,),
            SizedBox(height: 2),
            CustomText(text: name, color: white)
          ],
        )
    );
  }
}
