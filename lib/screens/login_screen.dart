import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/screens/register_screen.dart';
import 'package:movies/widgets/default_elevated_button.dart';

import '../widgets/default_text_form_field.dart';

class loginScreen extends StatelessWidget {
  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * .072),
                Image.asset(
                  "assets/images/logo.png",
                  height: MediaQuery.sizeOf(context).height * .13,
                  width: MediaQuery.sizeOf(context).width * .28,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .074),
                DefaultTextFormField(
                  hintText: "Email",
                  prefixIconImageName: "email_icon",
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .024),
                DefaultTextFormField(
                  hintText: "Password",
                  prefixIconImageName: "lock_Passowrd",
                  isPassword: true,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .018),
          
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    TextButton(
                      onPressed: forgetPass,
                      child: Text("Forget Password ?"),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .03),
          
                DefaultElevatedButton(label: "Login", onPressed:login),
                Row(mainAxisAlignment: .center,
                  children: [
                  Text("Don’t Have Account ?"),TextButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                    },child: Text(" Create One"),)
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void Function()? login() {
  //To Do login logic
}
void Function()? forgetPass() {

}
void Function()? rigester() {

}
