import 'package:building_app/view/screens/home_screen.dart';
import 'package:building_app/view/colors.dart';
import 'package:building_app/viewmodel/home_viewmodel.dart';
import 'package:building_app/viewmodel/notes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => NotesViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Building App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryColor,
          background: AppColors.backgroundColor,
          surface: AppColors.cardColor,
        ),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        hintColor: AppColors.hintColor,
        primaryColor: AppColors.primaryColor,
        cardColor: AppColors.cardColor,
      ),
      home: const HomeScreen(),
    );
  }
}
