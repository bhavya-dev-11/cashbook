import 'package:expense_tracker/reusables/category_style.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';

Future<dynamic> addTransactionBottomSheet(BuildContext context) {
  final selectedItem = ValueNotifier<String?>(null);

  final selectedDate = ValueNotifier<DateTime>(DateTime.now());

  return showModalBottomSheet(
    isScrollControlled: true,
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
          mainAxisSize: MainAxisSize.min,
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
                        height: 400,
                        child: TabBarView(
                          children: [
                            Column(
                              children: [
                                TextField(
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
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
                                SizedBox(height: 8),
                                DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField2<String>(
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      offset: const Offset(0, 2),
                                    ),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.category_rounded,
                                        color: AppColors.textTertiary,
                                      ),
                                      filled: true,
                                      fillColor: AppColors.surface2,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    isExpanded: true,
                                    hint: Text("Selected item"),
                                    valueListenable: selectedItem,   
                                    items: CategoryTheme.categoryStyle.keys.map(
                                      (category) {
                                        return DropdownItem(
                                          value: category,
                                          child: Text(category),
                                        );
                                      },
                                    ).toList(),

                                    onChanged: (value) {
                                      selectedItem.value = value;
                                    },
                                  ),
                                ),

                                SizedBox(height: 16),

                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: AppColors.surface2,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_rounded,
                                        color: AppColors.textTertiary,
                                      ),
                                      SizedBox(width: 16),
                                      GestureDetector(
                                        child: ValueListenableBuilder<DateTime>(
                                          valueListenable: selectedDate,
                                          builder: (context, date, child) {
                                            return Text(
                                              DateFormat(
                                                'd MMM yyyy',
                                              ).format(date),
                                              style: GoogleFonts.inter(
                                                color: AppColors.textPrimary,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            );
                                          },
                                        ),
                                        onTap: () async {
                                          final date = await showDatePicker(
                                            context: context,
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(3000),
                                            initialDate: DateTime.now(),
                                          );

                                          if (date != null) {
                                            selectedDate.value = date;
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16),

                                TextField(
                                  decoration: InputDecoration(
                                    
                                    filled: true,
                                    fillColor: AppColors.surface2,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    hintText: "Add Note",
                                    hintStyle: GoogleFonts.inter(color: AppColors.textTertiary, fontSize: 18, fontWeight: FontWeight.w600),
                                    prefixIcon: Icon(Icons.edit, color: AppColors.textTertiary),
                                  ),
                                  style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel", style: GoogleFonts.inter(color: AppColors.textSecondary, fontSize: 20, fontWeight: FontWeight.w600),),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: AppColors.incomeBg,
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: Text("Save", style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w600),),
                                      ),
                                    )
                                  ],
                                )

                              ],
                            ),

                            Column(
                              children: [
                                TextField(
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
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
                                SizedBox(height: 8),
                                DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField2<String>(
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      offset: const Offset(0, 2),
                                    ),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.category_rounded,
                                        color: AppColors.textTertiary,
                                      ),
                                      filled: true,
                                      fillColor: AppColors.surface2,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    isExpanded: true,
                                    hint: Text("Selected item"),
                                    valueListenable: selectedItem,   
                                    items: CategoryTheme.categoryStyle.keys.map(
                                      (category) {
                                        return DropdownItem(
                                          value: category,
                                          child: Text(category),
                                        );
                                      },
                                    ).toList(),

                                    onChanged: (value) {
                                      selectedItem.value = value;
                                    },
                                  ),
                                ),

                                SizedBox(height: 16),

                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: AppColors.surface2,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_rounded,
                                        color: AppColors.textTertiary,
                                      ),
                                      SizedBox(width: 16),
                                      GestureDetector(
                                        child: ValueListenableBuilder<DateTime>(
                                          valueListenable: selectedDate,
                                          builder: (context, date, child) {
                                            return Text(
                                              DateFormat(
                                                'd MMM yyyy',
                                              ).format(date),
                                              style: GoogleFonts.inter(
                                                color: AppColors.textPrimary,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            );
                                          },
                                        ),
                                        onTap: () async {
                                          final date = await showDatePicker(
                                            context: context,
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(3000),
                                            initialDate: DateTime.now(),
                                          );

                                          if (date != null) {
                                            selectedDate.value = date;
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16),

                                TextField(
                                  decoration: InputDecoration(
                                    
                                    filled: true,
                                    fillColor: AppColors.surface2,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    hintText: "Add Note",
                                    hintStyle: GoogleFonts.inter(color: AppColors.textTertiary, fontSize: 18, fontWeight: FontWeight.w600),
                                    prefixIcon: Icon(Icons.edit, color: AppColors.textTertiary),
                                  ),
                                  style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel", style: GoogleFonts.inter(color: AppColors.textSecondary, fontSize: 20, fontWeight: FontWeight.w600),),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: AppColors.expenseBg,
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: Text("Save", style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w600),),
                                      ),
                                    )
                                  ],
                                )

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
