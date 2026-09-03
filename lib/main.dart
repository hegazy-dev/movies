import 'package:flutter/material.dart';
import 'package:movies/features/profile/presentation/screens/profile_screen.dart';
import 'package:movies/theme/app_theme.dart';

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
      home: const ProfileScreen(),
    );
  }
}
