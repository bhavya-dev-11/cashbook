import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget reusableDrawer(void Function(int) onTabSelected, BuildContext context){
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 200,
          padding: EdgeInsets.all(22),
          decoration: BoxDecoration(
          gradient: AppColors.gradient
        ), child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.textPrimary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border, width: 0.4)
              ),
              child: Text("BV", style: GoogleFonts.inter(color: AppColors.textPrimary, fontWeight: FontWeight.w800, fontSize: 20),),
            ),
            SizedBox(height: 8,),
            Text("Bhavya Vishnani", style: GoogleFonts.inter(color: AppColors.textPrimary, fontWeight: FontWeight.w800, fontSize: 18),),
            Text("mrvishnani@gmail.com", style: GoogleFonts.inter(color: AppColors.textPrimary, fontWeight: FontWeight.w600, fontSize: 16),)
          ],
        ),),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home", style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w700, ),),
          onTap: (){
            onTabSelected(0);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.receipt_long_outlined),
          title: Text("Transactions", style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w700, ),),
          onTap: (){
            onTabSelected(1);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.bar_chart),
          title: Text("Reports", style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w700, ),),
          onTap: (){
            onTabSelected(2);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.person_outline_rounded),
          title: Text("Profile", style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w700, ),),
          onTap: (){
            onTabSelected(3);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout_rounded, color: AppColors.expense,),
          title: Text("Logout", style: GoogleFonts.inter(color: AppColors.expense, fontSize: 18, fontWeight: FontWeight.w700, ),),
        ),
      ],
    ),
  );
}