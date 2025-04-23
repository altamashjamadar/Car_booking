// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

  
//   Future<UserCredential> signInWithGoogle() async {

//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

//     if (googleUser == null) {
//       throw Exception('Google sign in aborted by user');
//     }
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     return await _auth.signInWithCredential(credential);
//   }

//   Future<UserCredential> signInWithFacebook() async {
//   final LoginResult result = await FacebookAuth.instance.login();

//   if (result.status == LoginStatus.success) {
//     final accessTokenData = result.accessToken!.toJson();
//     final String token = accessTokenData['token'];
    
//     final OAuthCredential credential =
//         FacebookAuthProvider.credential(token);

//     return await _auth.signInWithCredential(credential);
//   } else {
//     throw Exception('Facebook sign in failed: ${result.message}');
//   }
// }

// }
