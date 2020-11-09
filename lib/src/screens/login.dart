import 'package:firstapp/src/utils/commons.dart';
import 'package:firstapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: red,
      body: SingleChildScrollView(
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
                          onTap: (){},
                          child: Container(
                              child: CustomText(text: "Login", color: red[600], size: 22, weight: FontWeight.w600,),
                          ),
                        ),
                      ],
                    )
                  ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: 'Register here', size: 22, color: white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
