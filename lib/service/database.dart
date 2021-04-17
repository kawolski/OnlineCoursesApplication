import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emt/models/user.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  //  Collection Reference Users
  final CollectionReference users =
  FirebaseFirestore.instance.collection('Users');
  //  User Data from Snapshot
  Future updateUserData(String userName) async {
    return await users.doc(uid).set({
      'User Name': userName,
    });
  }
  //User Data From Snapshot
  CustomUser _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return CustomUser(
        uid: uid,
    );
  }
  //  Get Stream
  Stream<CustomUser> get userData {
    return users.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}