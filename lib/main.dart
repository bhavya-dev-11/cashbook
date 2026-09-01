import 'package:expense_tracker/homeshell.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(),
      darkTheme: _buildThemeData(),
      themeMode: ThemeMode.dark,
      title: "Cashbook",
      home: const Homeshell(),
    );
  }

  ThemeData _buildThemeData(){
    final colorScheme = ColorScheme.dark(
      primary: AppColors.violet,
      secondary: AppColors.blue,
      surface: AppColors.surface,
      error: AppColors.expense,
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        elevation: 0,
      ),
      
    );
  }
}
