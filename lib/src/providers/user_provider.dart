import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:uuid/uuid.dart';
import 'package:firstapp/src/models/user_model.dart';
import 'package:firstapp/src/utils//user_services.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  UserServices _userServices = UserServices();
  UserModel _userModel;

//  getter
  UserModel get userModel => _userModel;

  Status get status => _status;

  User get user => _user;

// public variables

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onStateChanged);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((user) {
//        _fireStore.collection('users').doc(result.user.uid).set({
//          'name': name.text,
//          'email': email.text,
//          'uid': result.user.uid,
//          "likedFood": [],
//          "likedRestaurants": []
//        });
          Map<String, dynamic> userCredentials = {
            'name': name.text,
            'email': email.text,
            'id': user.user.uid
          };
          _userServices.createUser(userCredentials);
      });
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  bool _onError(String error){
    _status = Status.Unauthenticated;
    notifyListeners();
    print("Error: $error");
    return false;
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void clearController() {
    name.text = "";
    password.text = "";
    email.text = "";
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }

  Future<void> _onStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(user.uid);
    }
    notifyListeners();
  }
}
