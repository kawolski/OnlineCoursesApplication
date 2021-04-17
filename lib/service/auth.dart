import 'package:emt/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomUser _userFromFirebaseUser(User user){
    return user == null ? null : CustomUser(uid: user.uid);
  }
  Stream<CustomUser> get user{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //  Sign In with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //  Register with email and password
  // Future registerWithEmailAndPassword(
  //     String userName, String email, String password) async {
  //   try {
  //     print("Registering...");
  //     UserCredential result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     User user = result.user;
  //     //  Create a new document for the user with the uid
  //     print("Registered");
  //     print("Saving...");
  //     await DatabaseService(uid: user.uid).updateUserData(userName);
  //     print("Saved");
  //     return _userFromFirebaseUser(user);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //  Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}