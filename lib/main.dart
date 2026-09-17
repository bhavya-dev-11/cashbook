import 'package:expense_tracker/homeshell.dart';
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:expense_tracker/services/storage_service.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final storageService = StorageService();

  final token = await storageService.readToken();

  runApp(ProviderScope(child: MainApp(
    isLoggedIn: token != null,
  )));
}

class MainApp extends StatelessWidget {
  final bool isLoggedIn;
  const MainApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(),
      darkTheme: _buildThemeData(),
      themeMode: ThemeMode.dark,
      title: "Cashbook",
      home: isLoggedIn ? Homeshell() : LoginScreen(),
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
