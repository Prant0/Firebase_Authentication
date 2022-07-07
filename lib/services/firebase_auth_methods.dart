import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_all/utils/showOtpDialog.dart';
import 'package:firebase_auth_all/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  User get user=>_auth.currentUser!;
  Stream<User?> get authState =>FirebaseAuth.instance.authStateChanges();


  //signup with email;
  Future<void> signUpEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      print("s1");
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendEmailVarification(context);
      print("s2");
    } on FirebaseAuthException catch (e) {
      print("Wronggggggggg");
      showSnackBar(context, "${e.message}");
      //  showInToast(context, "${e.message}");
    }
  }

  Future<void> sendEmailVarification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, "Email Varification Send!");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "${e.message}");
    }
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVarification(context);
      } else {
        showSnackBar(context, "Login Success");
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "${e.message}");
    }
  }

  Future<void> phoneSignin(BuildContext context, String phoneNumber) async {
    try {
      TextEditingController codeController = TextEditingController();
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            showSnackBar(context, "${e.message}");
          },
          codeSent: ((String verificationId, int? resentToken) async {
            showOTPDialog(
                context: context,
                codeController: codeController,
                onPressed: () async {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: codeController.text.trim());
                  await _auth.signInWithCredential(credential);
                  Navigator.of(context).pop();
                });
          }),
          codeAutoRetrievalTimeout: (String verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "${e.message}");
    }
  }

  Future<void> googleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        print("email isssssssssssssssss @email");
      }
      print("aaaaaaaaaaaaaaa");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "${e.message}");
      print("bbbbbb");
    }
  }

  Future<void> signInWithFacebook({required BuildContext context}) async {
    try {
      final LoginResult loginResult=await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential=FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await _auth.signInWithCredential(facebookAuthCredential);

    } on FirebaseAuthException catch (e) {
      print("Wronggggggggg");
      showSnackBar(context, "${e.message}");
      //  showInToast(context, "${e.message}");
    }
  }
  Future<void> signInAnonymosly({required BuildContext context}) async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      print("Wronggggggggg");
      showSnackBar(context, "${e.message}");
      //  showInToast(context, "${e.message}");
    }
  }


  Future<void> signOut({required BuildContext context}) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print("Wronggggggggg");
      showSnackBar(context, "${e.message}");
      //  showInToast(context, "${e.message}");
    }
  }



  Future<void> deleteAccount({required BuildContext context}) async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      print("Wronggggggggg");
      showSnackBar(context, "${e.message}");
      //  showInToast(context, "${e.message}");
    }
  }


}
