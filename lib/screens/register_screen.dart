import 'package:flutter/material.dart';
import 'package:movies/widgets/avatar_selector.dart';
import 'package:movies/widgets/default_elevated_button.dart';
import 'package:movies/widgets/language_selector.dart';
import '../widgets/default_text_form_field.dart';
import 'package:movies/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/register";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Register"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              AvatarSelector(),

              SizedBox(height: screenHeight * .024),

              DefaultTextFormField(
                hintText: "Name",
                prefixIconImageName: "name_icon",
              ),

              SizedBox(height: screenHeight * .024),

              DefaultTextFormField(
                hintText: "Email",
                prefixIconImageName: "email_icon",
              ),

              SizedBox(height: screenHeight * .024),

              DefaultTextFormField(
                hintText: "Password",
                prefixIconImageName: "lock_Passowrd",
                isPassword: true,
              ),

              SizedBox(height: screenHeight * .024),

              DefaultTextFormField(
                hintText: "Confirm Password",
                prefixIconImageName: "lock_Passowrd",
                isPassword: true,
              ),

              SizedBox(height: screenHeight * .024),

              DefaultTextFormField(
                hintText: "Phone Number",
                prefixIconImageName: "phone_icon",
              ),

              SizedBox(height: screenHeight * .024),

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
                        LoginScreen.routeName,
                      );
                    },
                    child: Text("Login"),
                  ),
                ],
              ),

              LanguageSelector(firstLanguage: "🇺🇸", secondLanguage: "🇪🇬"),
            ],
          ),
        ),
      ),
    );
  }
}

void Function()? createAccount() {
  //logic creat account
}
