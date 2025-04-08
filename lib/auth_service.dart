import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Implement Google sign in
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Abort if user cancels the sign in
    if (googleUser == null) {
      throw Exception('Google sign in aborted by user');
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign in flow
  final LoginResult result = await FacebookAuth.instance.login();

  if (result.status == LoginStatus.success) {
    // Convert the access token to JSON and extract the token string
    final accessTokenData = result.accessToken!.toJson();
    final String token = accessTokenData['token'];
    
    // Create a credential from the token
    final OAuthCredential credential =
        FacebookAuthProvider.credential(token);

    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential);
  } else {
    throw Exception('Facebook sign in failed: ${result.message}');
  }
}

}
