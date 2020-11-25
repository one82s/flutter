import 'package:firstapp/src/screens/login.dart';
import 'package:firstapp/src/screens/home.dart';
import 'package:firstapp/src/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firstapp/src/providers/user_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider.value(value: UserProvider.initialize())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wok with John',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScreenController(),
    )
  ));
}

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Wok with John',
//      theme: ThemeData(
//        primarySwatch: Colors.red,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
//      home: Login(),
//    );
//  }
//}

class ScreenController extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return Home();
      default: Login();
    }
  }
}