import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_all/firebase_options.dart';
import 'package:firebase_auth_all/screens/home_screen.dart';
import 'package:firebase_auth_all/screens/login_email_password_screen.dart';
import 'package:firebase_auth_all/screens/login_screen.dart';
import 'package:firebase_auth_all/screens/phone_screen.dart';
import 'package:firebase_auth_all/screens/signup_email_password_screen.dart';
import 'package:firebase_auth_all/services/firebase_auth_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
/*  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kIsWeb) {
    FacebookAuth.i.webInitialize(
      appId: "1129634001214960", // Replace with your app id
      cookie: true,
      xfbml: true,
      version: "v12.0",
    );
  }*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(create: (_)=>FirebaseAuthMethods(FirebaseAuth.instance)),
        StreamProvider(create: (context)=>context.read<FirebaseAuthMethods>().authState,
            initialData: null)
      ],
      child: MaterialApp(
        title: 'Flutter Firebase Auth Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthWrapper(),
        routes: {
          EmailPasswordSignup.routeName: (context) =>
          const EmailPasswordSignup(),
          EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
          PhoneScreen.routeName: (context) => const PhoneScreen(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const HomeScreen();
    }
    return const LoginScreen();
  }
}
