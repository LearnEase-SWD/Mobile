import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Google Sign-In
  Future<User?> signInWithGoogle() async {
    try {
      // 1. Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print('Google Sign-In canceled by user');
        return null;
      }

      // 2. Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // 3. Create a new credential for the user
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 4. Sign in to Firebase with the Google credential
      var userCredential = await _auth.signInWithCredential(credential);

      // 5. Return the user from Firebase authentication
      return userCredential.user;
    } catch (e) {
      print('Error during Google Sign-In: $e');
      return null;
    }
  }

  // Google Sign-Out
  Future<void> signOutWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print('Error during Google Sign-Out: $e');
    }
  }
}