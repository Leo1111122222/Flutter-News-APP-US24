import 'package:US24/Controller/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpInGoogle {
  Future sg() async {
    try {
      final GoogleSignInAccount? GUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication GAuth = await GUser!.authentication;
      final Credential = GoogleAuthProvider.credential(
        accessToken: GAuth.accessToken,
        idToken: GAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(Credential);
      return Auth();
    } catch (e) {
      print(e);
    }
  }
}
