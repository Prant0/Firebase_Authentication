

import 'package:firebase_auth_all/services/firebase_auth_methods.dart';
import 'package:firebase_auth_all/widgets/custom_button.dart';
import 'package:firebase_auth_all/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneScreen extends StatefulWidget {
  static String routeName = '/phone';
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneController = TextEditingController();
void phoneSignin()async{
  //FirebaseAuthMethods(FirebaseAuth.instance).phoneSignin(context,phoneController.text);
  context.read<FirebaseAuthMethods>().phoneSignin(context, phoneController.text);
}
  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: phoneController,
            hintText: 'Enter phone number',
          ),
          CustomButton(
            onTap: phoneSignin,
            text: 'OK',
          ),
        ],
      ),
    );
  }
}
