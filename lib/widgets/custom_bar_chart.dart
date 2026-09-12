import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBarChart extends StatefulWidget {
  const CustomBarChart({super.key});

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

List<Map<String, dynamic>> monthlyComparison = [
  {"week": "week 1", "income": 68000.0, "expense": 38000.0},
  {"week": "week 2", "income": 54000.0, "expense": 58000.0},
  {"week": "week 3", "income": 82000.0, "expense": 34000.0},
  {"week": "week 4", "income": 62000.0, "expense": 48000.0},
];

class _CustomBarChartState extends State<CustomBarChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            itemCount: monthlyComparison.length,
            itemBuilder: (context, index) {
              final data = monthlyComparison[index];

              return Padding(
                padding: const EdgeInsets.only(right: 36),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: data["income"] * 0.001 * 2,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.income,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(
                          height: data["expense"] * 0.001 * 2,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.expense,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      data["week"],
                      style: GoogleFonts.inter(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8,),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 50,),
          child: Row(
            children: [
              CircleAvatar(backgroundColor: AppColors.income, radius: 10),
              const SizedBox(width: 8),
              Text(
                "Income",
                style: GoogleFonts.inter(color: AppColors.textPrimary),
              ),

              const SizedBox(width: 24),

              CircleAvatar(backgroundColor: AppColors.expense, radius: 10),
              const SizedBox(width: 8),
              Text(
                "Expense",
                style: GoogleFonts.inter(color: AppColors.textPrimary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
