
// contains material design. design language developed by google, defines some guidelines
//    for applications such as andriod and ios
import "package:flutter/material.dart";

//entrypoint of the app
void main(){
  //runApp() inflate the widget and attach to the screen. will display whatever widget that is passed in the parameter
  runApp(
      //Center widget: wrapper widget to center the child widget
      Center(
        child:
        //Text widget: press ctrl+left click to go to the documentation
        Text("Hello World!",
            textDirection:TextDirection.ltr),
      )
    );
}