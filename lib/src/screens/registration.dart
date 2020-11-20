import 'package:firstapp/src/providers/user_provider.dart';
import 'package:firstapp/src/screens/home.dart';
import 'package:firstapp/src/screens/login.dart';
import 'package:firstapp/src/utils/commons.dart';
import 'package:firstapp/src/utils/screen_navigation.dart';
import 'package:firstapp/src/widgets/custom_text.dart';
import 'package:firstapp/src/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: red,
      body: SafeArea(
        child: userProvider.status == Status.Authenticating ? Loading(): SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/logo.jpg', width: 240.0, height: 240.0,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        color: white,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        controller: userProvider.name,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "User name",
                            hintStyle: TextStyle(color: black),
                            icon: Icon(Icons.person, color: black,)
                        ),
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        color: white,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        controller: userProvider.email,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(color: black),
                            icon: Icon(Icons.email, color: black,)
                        ),
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        color: white,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        controller: userProvider.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: black),
                          suffixIcon: Icon(Icons.remove_red_eye_outlined, color: black,),
                          icon: Icon(Icons.lock_outline, color: black,),
                        ),
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: yellow[400],
                      border: Border.all(color: white),
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(top:10.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: ()async{
                              if(!await userProvider.signUp()){
                                _key.currentState.showSnackBar(
                                    SnackBar(content: Text("Registration failed!"))
                                );
                                return;
                              }
                              userProvider.clearController();
                              changeScreenReplacement(context, Home());
                            },
                            child: Container(
                              child: CustomText(text: "Register", color: red[600], size: 22, weight: FontWeight.w600,),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){changeScreen(context, Login());},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Login here', size: 22, color: white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
