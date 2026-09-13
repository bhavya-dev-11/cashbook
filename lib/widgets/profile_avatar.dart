import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget profileAvatar(String name) {
  return Center(
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: AppColors.surface2,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.violet, width: 6),
          ),
          child: Text(
            name,
            style: GoogleFonts.inter(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: CircleAvatar(
            maxRadius: 16,
            backgroundColor: AppColors.violet,
            child: Icon(Icons.camera_alt_rounded, color: AppColors.textPrimary, size: 16,),
          ),
        ),
      ],
    ),
  );
}
