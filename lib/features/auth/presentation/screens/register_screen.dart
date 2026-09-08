import 'package:flutter/material.dart';

import 'package:movies/features/auth/presentation/screens/login_screen.dart';
import 'package:movies/features/auth/presentation/widgets/avatar_selector.dart';
import 'package:movies/features/auth/presentation/widgets/language_selector.dart';

import 'package:movies/shared/widgets/default_elevated_button.dart';
import 'package:movies/shared/widgets/default_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/register";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Register"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const AvatarSelector(),

              SizedBox(height: screenHeight * .024),

              const DefaultTextFormField(
                hintText: "Name",
                prefixIconImageName: "name_icon",
              ),

              SizedBox(height: screenHeight * .024),

              const DefaultTextFormField(
                hintText: "Email",
                prefixIconImageName: "email_icon",
              ),

              SizedBox(height: screenHeight * .024),

              const DefaultTextFormField(
                hintText: "Password",
                prefixIconImageName: "lock_Passowrd",
                isPassword: true,
              ),

              SizedBox(height: screenHeight * .024),

              const DefaultTextFormField(
                hintText: "Confirm Password",
                prefixIconImageName: "lock_Passowrd",
                isPassword: true,
              ),

              SizedBox(height: screenHeight * .024),

              const DefaultTextFormField(
                hintText: "Phone Number",
                prefixIconImageName: "phone_icon",
              ),

              SizedBox(height: screenHeight * .024),

              DefaultElevatedButton(label: "Create Account", onPressed: () {}),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Have Account ?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        LoginScreen.routeName,
                      );
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),

              const LanguageSelector(
                firstLanguage: "🇺🇸",
                secondLanguage: "🇪🇬",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
