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
      themeMode: ThemeMode.dark,
      title: "Cashbook",
      theme: _buildThemeData(),
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
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        elevation: 2,
        selectedItemColor: AppColors.border,
        unselectedItemColor: AppColors.textTertiary
      )
    );
  }
}
