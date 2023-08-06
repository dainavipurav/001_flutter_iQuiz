import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logging/logging.dart';

class SignInController extends GetxController {
  final log = Logger("Sign in controller");

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    GoogleSignInAccount? googleUsers = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUsers?.authentication;

    AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(authCredential);

    log.fine("Signed in User : ${user.toString()}");
  }
}
