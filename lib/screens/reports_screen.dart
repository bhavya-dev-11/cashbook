import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/widgets/app_bar.dart';
import 'package:expense_tracker/widgets/custom_bar_chart.dart';
import 'package:expense_tracker/widgets/drawer.dart';
import 'package:expense_tracker/widgets/filter_chips.dart';
import 'package:expense_tracker/widgets/piechart_only.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportsScreen extends StatefulWidget {
  final void Function(int) onTabSelected;
  const ReportsScreen({super.key, required this.onTabSelected});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

List<Map<String, dynamic>> categoryBreakdown = [
  {"category": "Food", "amount": 6800, "color": Color(0xFFFFB454)},
  {"category": "Travel", "amount": 5800, "color": Color(0xFF4C7EFF)},
  {"category": "Bills", "amount": 4800, "color": Color(0xFFB98CFF)},
  {"category": "Shopping", "amount": 3900, "color": Color(0xFF38D6C6)},
  {"category": "Other", "amount": 2800, "color": Color(0xFFFB7A88)},
];

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppBar("Reports"),
      drawer: reusableDrawer(widget.onTabSelected, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FilterChips(
                selectedFilter: "This Month",
                filters: ["This Month", "Last Month", "This Year", "Last Year"],
              ),
              SizedBox(height: 26),
              Container(
                width: double.infinity,
                height: 300,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.surface2,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: AppColors.border, width: 0.3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Expense by category",
                      style: GoogleFonts.inter(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            PiechartOnly(categoryBreakdown: categoryBreakdown),
                            Positioned(
                              bottom: 0,
                              top: 90,
                              left: 0,
                              right: 0,
                              child: Column(
                                children: [
                                  Text(
                                    "24.5k",
                                    style: GoogleFonts.inter(
                                      color: AppColors.textPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    "SPENT",
                                    style: GoogleFonts.inter(
                                      color: AppColors.textSecondary,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 220,
                            child: ListView(
                              children: categoryBreakdown.map((item) {
                                final amount = double.parse(
                                  item["amount"].toString(),
                                );
                                final percentage = (amount / 24500) * 100;
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: item["color"],
                                    radius: 10,
                                  ),
                                  title: Text(
                                    item["category"],
                                    style: GoogleFonts.inter(
                                      color: AppColors.textPrimary,
                                      fontSize: 12,
                                    ),
                                  ),
                                  trailing: Text(
                                    '${percentage.toStringAsFixed(0)}%',
                                    style: GoogleFonts.inter(
                                      color: AppColors.textPrimary,
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26),
              Container(
                width: double.infinity,
                height: 300,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.surface2,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: AppColors.border, width: 0.3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Income vs Expense",
                      style: GoogleFonts.inter(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(height: 220, child: CustomBarChart()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
