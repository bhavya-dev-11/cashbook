import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppBar("Cashbook"),
      body: Padding(
        padding: EdgeInsets.all(22),
        child: Column(children: [balanceCard("48,320.75", "75,000", "24,180")]),
      ),
    );
  }

  Widget balanceCard(String bal, String income, String expense) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: AppColors.gradient,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TOTAL BALANCE",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w800,
              fontSize: 16,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "₹$bal",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w800,
              fontSize: 42,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                decoration: BoxDecoration(
                  color: AppColors.textPrimary.withOpacity(0.3),
                  border: Border.all(color: AppColors.border, width: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.south_west_rounded,
                          color: AppColors.border,
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Income",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "₹$income",
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                decoration: BoxDecoration(
                  color: AppColors.textPrimary.withOpacity(0.3),
                  border: Border.all(color: AppColors.border, width: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_outward,
                          color: AppColors.border,
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Expense",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "₹$expense",
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
