import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';

class AuthController extends GetxController {
  //text controllers
  var emailController1 = TextEditingController();
  var passwordController1 = TextEditingController();

  var isLoading = false.obs;
  //login method
  Future<UserCredential?> loginMethod(context) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController1.text, password: passwordController1.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //signout method
  signoutmethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
