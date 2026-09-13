import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/widgets/app_bar.dart';
import 'package:expense_tracker/widgets/drawer.dart';
import 'package:expense_tracker/widgets/options_tile.dart';
import 'package:expense_tracker/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  final void Function(int) onTabSelected;
  const ProfileScreen({super.key, required this.onTabSelected});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppBar("Profile"),
      drawer: reusableDrawer(widget.onTabSelected, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileAvatar("BV"),
              SizedBox(height: 18),
              Center(
                child: Text(
                  "Bhavya Vishnani",
                  style: GoogleFonts.inter(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "mrvishnani@gmail.com",
                  style: GoogleFonts.inter(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColors.surface2,
                        border: Border.all(color: AppColors.border, width: 0.3),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "₹48.3K",
                            style: GoogleFonts.inter(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "BALANCE",
                            style: GoogleFonts.inter(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColors.surface2,
                        border: Border.all(color: AppColors.border, width: 0.2),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "284",
                            style: GoogleFonts.inter(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "TRANSACTIONS",
                            style: GoogleFonts.inter(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "ACCOUNT",
                style: GoogleFonts.inter(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              optionTile(
                Icons.person_outline_rounded,
                AppColors.bills,
                "Edit Profile",
              ),
              SizedBox(height: 12),
              optionTile(
                Icons.shield_outlined,
                AppColors.income,
                "Security",
              ),
              SizedBox(height: 12),
              Text(
                "SUPPORT",
                style: GoogleFonts.inter(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              optionTile(
                Icons.help_outline_outlined,
                AppColors.violet,
                "Help & Support",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
