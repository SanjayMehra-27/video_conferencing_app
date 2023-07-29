import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method to handle user registration
  Future<String?> registerUser(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      return user?.uid;
    } catch (e) {
      print('Error during user registration: $e');
      return null;
    }
  }

  // Method to handle user login
  Future<String?> loginUser(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      return user?.uid;
    } catch (e) {
      print('Error during user login: $e');
      return null;
    }
  }

  // Method to handle user logout
  Future<void> logoutUser() async {
    await _auth.signOut();
  }
}
