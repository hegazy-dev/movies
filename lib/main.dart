import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies/screens/forget_password_Screen.dart';
import 'package:movies/screens/login_screen.dart';
import 'package:movies/screens/register_screen.dart';
import 'package:movies/theme/app_theme.dart';
void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      themeMode: .dark,
      routes: {
        loginScreen.routeName: (_) => loginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        ForgetPasswordScreen.routeName: (_) => ForgetPasswordScreen(),
      },
      initialRoute: ForgetPasswordScreen.routeName,
    );
  }
}
