import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/widgets/default_elevated_button.dart';

import '../widgets/default_text_form_field.dart';
import 'package:movies/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"), centerTitle: true),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                DefaultTextFormField(
                  hintText: "Name",
                  prefixIconImageName: "name_icon",
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .024),
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
                SizedBox(height: MediaQuery.sizeOf(context).height * .024),
                DefaultTextFormField(
                  hintText: "Confirm Password",
                  prefixIconImageName: "lock_Passowrd",
                  isPassword: true,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .024),

                DefaultTextFormField(
                  hintText: "Phone Number",
                  prefixIconImageName: "phone_icon",
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .024),

                DefaultElevatedButton(
                  label: "Create Account",
                  onPressed: createAccount,
                ),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text("Already Have Account ?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          loginScreen.routeName,
                        );
                      },
                      child: Text(" Login"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void Function()? createAccount() {
  //logic creat account
}
