import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/default_elevated_button.dart';
import '../widgets/default_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "/forgetpass";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forget Password")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/images/Forgot password-bro 1.svg",
                  height: MediaQuery.sizeOf(context).height * .46,
                ),
                const SizedBox(height: 24),
                DefaultTextFormField(
                  hintText: "Email",
                  prefixIconImageName: "email_icon",
                ),
                const SizedBox(height: 24),

                DefaultElevatedButton(label: "Verify Email", onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
