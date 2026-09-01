import 'package:flutter/material.dart';

class CategoryTheme {
  static const Map<String, Map<String, dynamic>> categoryStyle = {
    "food": {"icon": Icons.restaurant_rounded, "color": Color(0xFFFFB454)},
    "salary": {"icon": Icons.account_balance_wallet_rounded, "color": Color(0xFF34D399)},
    "travel": {"icon": Icons.flight_rounded, "color": Color(0xFF4C7EFF)},
    "bills": {"icon": Icons.receipt_rounded, "color": Color(0xFFB98CFF)},
    "shopping": {"icon": Icons.shopping_bag_rounded, "color": Color(0xFF38D6C6)},
    "entertainment": {"icon": Icons.movie_rounded, "color": Color(0xFFFB7A88)},
    "freelance": {"icon": Icons.work_rounded, "color": Color(0xFF34D399)},
    "groceries": {"icon": Icons.local_grocery_store_rounded, "color": Color(0xFFFFB454)},
    "health": {"icon": Icons.local_hospital_rounded, "color": Color(0xFFFB7A88)},
    "rent": {"icon": Icons.home_rounded, "color": Color(0xFFB98CFF)},
  };

  // Bas Map wapas bhejo, koi naya class nahi
  static Map<String, dynamic> forCategory(String category) {
    return categoryStyle[category] ?? categoryStyle["food"]!;
  }
}