import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapp/src/models/user_model.dart';

class UserServices{
  String collection = "users";
  Firestore _firestore = Firestore.instance;

  void createUser(Map<String, dynamic> values) {
    String id = values["id"];
    _firestore.collection(collection).doc(id).set(values);
  }

  void updateUser(Map<String, dynamic> values){
    _firestore.collection(collection).doc(values['id']).update(values);
  }


  Future<UserModel> getUserById(String id) => _firestore.collection(collection).document(id).get().then((doc){
    return UserModel.fromSnapshot(doc);
  });
}