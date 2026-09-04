import 'package:flutter/material.dart';

import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:movies/features/auth/presentation/screens/login_screen.dart';
import 'package:movies/features/auth/presentation/screens/register_screen.dart';
import 'package:movies/features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        ForgetPasswordScreen.routeName: (_) => const ForgetPasswordScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
