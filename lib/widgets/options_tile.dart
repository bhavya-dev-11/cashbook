import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget optionTile(IconData optionIcon,Color iconColor, String title) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      color: AppColors.surface2,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.border, width: 0.2),
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: iconColor.withOpacity(0.3),
          ),
          child: Icon(optionIcon, size: 20, color: iconColor,),
        ),
        SizedBox(width: 12,),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w800),),
              Icon(Icons.chevron_right_rounded, color: AppColors.border,)
            ],
          ),
        )
      ],
    ),
  );
}
