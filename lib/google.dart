import 'package:firebase_auth/firebase_auth.dart';

//----------google----------
final FirebaseAuth _auth = FirebaseAuth.instance;

void signInGoogle() {
  try {
    GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
    _auth.signInWithProvider(_googleAuthProvider);
  } catch (error) {
    print(error);
  }
}

//print console if user is loged in
void checkUser() {
  _auth.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}

//----gets the info of current user----
void getInfo() {
  final my_user = _auth.currentUser;
  if (my_user != null) {
    // Name, email address, and profile photo URL
    final name = my_user.displayName;
    final email = my_user.email;
    final photoUrl = my_user.photoURL;
    final uid = my_user.uid;
    print("name: " +
        name.toString() +
        " email:" +
        email.toString() +
        " photo url: " +
        photoUrl.toString() +
        " uid: " +
        uid.toString());
  } else {
    print("user is null");
  }
}

signOutGoogle() async {
  await FirebaseAuth.instance.signOut();
}
