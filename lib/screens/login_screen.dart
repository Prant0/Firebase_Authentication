
import 'package:firebase_auth_all/screens/login_email_password_screen.dart';
import 'package:firebase_auth_all/screens/phone_screen.dart';
import 'package:firebase_auth_all/screens/signup_email_password_screen.dart';
import 'package:firebase_auth_all/services/firebase_auth_methods.dart';
import 'package:firebase_auth_all/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, EmailPasswordSignup.routeName);
              },
              text: 'Email/Password Sign Up',
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, EmailPasswordLogin.routeName);
              },
              text: 'Email/Password Login',
            ),
            CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, PhoneScreen.routeName);
                },
                text: 'Phone Sign In'),
            CustomButton(
              onTap: () {
              //  context.read<FirebaseAuthMethods>().signInWithGoogle(context);
           //     FirebaseAuthMethods(FirebaseAuth.instance).googleSignIn(context);
                context.read<FirebaseAuthMethods>().googleSignIn(context);
              },
              text: 'Google Sign In',
            ),
            CustomButton(
              onTap: () {
                //  context.read<FirebaseAuthMethods>().signInWithGoogle(context);
                //_googleSignIn.disconnect();
              },
              text: 'Google Sign Out',
            ),
            CustomButton(
              onTap: () {
               // context.read<FirebaseAuthMethods>().signInWithFacebook(context);
              //  FirebaseAuthMethods(FirebaseAuth.instance).signInWithFacebook(context: context);
                context.read<FirebaseAuthMethods>().signInWithFacebook(context: context);
              },
              text: 'Facebook Sign In',
            ),
            CustomButton(
              onTap: () {
               // context.read<FirebaseAuthMethods>().signInAnonymously(context);
              //  FirebaseAuthMethods(FirebaseAuth.instance).signInAnonymosly(context: context);
                context.read<FirebaseAuthMethods>().signInAnonymosly(context: context);
              },
              text: 'Anonymous Sign In',
            ),
          ],
        ),
      ),
    );
  }
  GoogleSignIn _googleSignIn=GoogleSignIn();
}
