import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  final String uid;

  DataBase(this.uid);
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  Future<void> deleteUserData() {
    return userCollection.doc(uid).delete();
  }
}
