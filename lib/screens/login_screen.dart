import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/screens/forget_password_Screen.dart';
import 'package:movies/screens/register_screen.dart';
import 'package:movies/theme/app_colors.dart';
import 'package:movies/theme/app_text_styles.dart';
import 'package:movies/widgets/default_elevated_button.dart';
import 'package:movies/widgets/language_selector.dart';

import '../widgets/default_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: screenHeight * .072),
                Image.asset(
                  "assets/images/logo.png",
                  height: screenHeight * .13,
                  width: screenWidth * .30,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: screenHeight * .074),
                DefaultTextFormField(
                  hintText: "Email",
                  prefixIconImageName: "email_icon",
                ),
                SizedBox(height: screenHeight * .024),
                DefaultTextFormField(
                  hintText: "Password",
                  prefixIconImageName: "lock_passowrd",
                  isPassword: true,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        ForgetPasswordScreen.routeName,
                      );
                    },
                    child: Text("Forget Password?"),
                  ),
                ),
                SizedBox(height: screenHeight * .02),

                DefaultElevatedButton(label: "Login", onPressed: login),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text("Don’t Have Account ?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: Text("Create One"),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * .02),

                Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.primary, thickness: 1),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                      child: Text(
                        'OR',
                        style: AppTextStyles.textTheme.titleMedium,
                      ),
                    ),
                    Expanded(
                      child: Divider(color: AppColors.primary, thickness: 1),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * .03),

                DefaultElevatedButton(
                  label: 'Login With Google',
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/google_icon.svg'),
                ),

                SizedBox(height: screenHeight * .03),

                LanguageSelector(firstLanguage: "🇺🇸", secondLanguage: "🇪🇬"),
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
void Function()? forgetPass() {}
void Function()? rigester() {}
