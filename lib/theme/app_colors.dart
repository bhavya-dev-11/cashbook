import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // Background
  static const bg = Color(0xFF0A0D14);
  static const surface = Color(0xFF131826);
  static const surface2 = Color(0xFF1B2233);
  static const border = Color(0x12FFFFFF); // 7% white

  // Text
  static const textPrimary = Color(0xFFF2F4FA);
  static const textSecondary = Color(0xFF8C93A8);
  static const textTertiary = Color(0xFF5B6478);

  // Accent gradient
  static const violet = Color(0xFF8A6BFF);
  static const blue = Color(0xFF4C7EFF);
  static const gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [violet, blue],
  );

  // Income / Expense
  static const income = Color(0xFF34D399);
  static const incomeBg = Color(0x2134D399); // 13% opacity
  static const expense = Color(0xFFFB7A88);
  static const expenseBg = Color(0x21FB7A88);

  // Categories
  static const food = Color(0xFFFFB454);
  static const travel = Color(0xFF4C7EFF);
  static const bills = Color(0xFFB98CFF);
  static const shopping = Color(0xFF38D6C6);
}