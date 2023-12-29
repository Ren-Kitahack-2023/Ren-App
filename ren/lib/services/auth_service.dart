import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  
  // Google Sign In
  signInWithGoogle() async {
    try {

      // begion the sign in process
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      
      // get the authentication
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      
      // get the credentials
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, 
        idToken: googleAuth?.idToken
      );


    // sign in with the credentials
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      
    } catch (e) {
      print(e);
    }
  }


}
