import 'package:expense_tracker/reusables/category_style.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<dynamic> addTransactionBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          children: [
            Text(
              "Add Transaction",
              style: GoogleFonts.inter(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w800,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 16),
            DefaultTabController(
              length: 2,
              child: Builder(
                builder: (context) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.surface2,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TabBar(
                          onTap: (index) {},
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: Colors.transparent,
                          labelStyle: GoogleFonts.inter(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                          unselectedLabelStyle: GoogleFonts.inter(
                            color: AppColors.textTertiary,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                          indicator: BoxDecoration(
                            gradient: AppColors.gradient,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          tabs: [
                            Tab(text: "Income"),
                            Tab(text: "Expense"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: TabBarView(
                          children: [
                            Column(
                              children: [
                                TextField(
                                  keyboardType: TextInputType.numberWithOptions(),
                                  showCursor: false,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    color: AppColors.textPrimary,
                                    fontSize: 52,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  decoration: InputDecoration(
                                    fillColor: AppColors.surface2,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.currency_rupee_rounded,
                                      color: AppColors.textTertiary,
                                    ),
                                    hintText: "0.00",
                                    hintStyle: GoogleFonts.inter(
                                      color: AppColors.textTertiary,
                                      fontSize: 52,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16,),
                                
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
