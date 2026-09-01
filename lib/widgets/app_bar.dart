import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget reusableAppBar(String title) {
  return AppBar(
    backgroundColor: AppColors.surface,
    automaticallyImplyLeading: false, // default back button/leading hata do
    titleSpacing: 0, // taaki humara manual padding hi control kare
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border, width: 0.3),
                borderRadius: BorderRadius.circular(16),
                color: AppColors.surface2,
              ),
              child: const Icon(Icons.menu_rounded, size: 20),
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(fontWeight: FontWeight.w600),
            ),
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border, width: 0.3),
                borderRadius: BorderRadius.circular(16),
                color: AppColors.surface2,
              ),
              child: const Icon(Icons.notifications_rounded, size: 20),
            ),
          ),
        ],
      ),
    ),
  );
}