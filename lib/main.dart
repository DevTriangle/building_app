import 'package:building_app/view/screens/home_screen.dart';
import 'package:building_app/view/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Building App',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor, hintColor: AppColors.hintColor, primaryColor: AppColors.primaryColor),
      home: const HomeScreen(),
    );
  }
}
