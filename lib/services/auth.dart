import 'package:firebase_auth/firebase_auth.dart';
import 'package:pretty_toughh/models/user.dart';
import 'package:pretty_toughh/models/user.dart';
import 'package:pretty_toughh/services/database.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj on Firebase user
  User _userFromFirebaseAuth (FirebaseUser user){
    return user != null ? User(uid: user.uid) : User(uid: 'null');
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseAuth);
    // .map((FirebaseUser user) => _userFromFirebaseAuth(user))
  }

  //sign in anonymous
  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseAuth(user);
    }catch(e){
      print(e.toString());
      print('failed sign in');
      return null;
    }
  }
  //sign in with email
  Future signInWithEmail(String email, String password) async{
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      

      return _userFromFirebaseAuth(user);
    }catch(e){
      print(e.toString());
      print('failed to signIn');
      return null;
    }
  }

  //register with email & password
  Future registerWithEmail(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      //database
      await DatabaseService(uid: user.uid).updateUser('0', 'hey, new women', '0');
      return _userFromFirebaseAuth(user);
    }catch(e){
      print(e.toString());
      print('failed to register');
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      print('error signing out');
    }
  }
}