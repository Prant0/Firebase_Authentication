import 'package:firebase_auth_all/services/firebase_auth_methods.dart';
import 'package:firebase_auth_all/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;

    return Scaffold(
      appBar: AppBar(
        title: Text("logged in"),
      ),
       body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // when user signs anonymously or with phone, there is no email
          if (!user.isAnonymous && user.phoneNumber == null) Text(user.email!),
          if (!user.isAnonymous && user.phoneNumber == null)
            Text(user.providerData[0].providerId),
          // display phone number only when user's phone number is not null
          if (user.phoneNumber != null) Text(user.phoneNumber!),
          // uid is always available for every sign in method
          Text(user.uid),
          // display the button only when the user email is not verified
          // or isnt an anonymous user
          if (!user.emailVerified && !user.isAnonymous)
            CustomButton(
              onTap: () {
                context
                    .read<FirebaseAuthMethods>()
                    .sendEmailVarification(context);
              },
              text: 'Verify Email',
            ),
          CustomButton(
            onTap: () {
              context.read<FirebaseAuthMethods>().signOut(context: context);
            },
            text: 'Sign Out',
          ),
          CustomButton(
            onTap: () {
              context.read<FirebaseAuthMethods>().deleteAccount(context: context);
            },
            text: 'Delete Account',
          ),
        ],
      ),
    /*  body: Column(
        children: [
          if (!user.isAnonymous && user.phoneNumber == null)
            Text("${user.email}"),
          if (!user.isAnonymous && user.phoneNumber == null)
            Text("${user.providerData[0].providerId}"),
          if (user.phoneNumber != null) Text("${user.phoneNumber}"),
          Text(user.uid),
          if (!user.emailVerified && !user.isAnonymous)
            CustomButton(
                onTap: () {
                  context
                      .read<FirebaseAuthMethods>()
                      .sendEmailVarification(context);
                },
                text: "Verify Email"),
          CustomButton(onTap: () {
            context.read<FirebaseAuthMethods>().signOut(context: context);
          }, text: "Sign Out"),


          CustomButton(onTap: () {
            context.read<FirebaseAuthMethods>().deleteAccount(context: context);
          }, text: "Delete Account")
        ],
      ),*/
    );
  }
}
