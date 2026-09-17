import 'package:expense_tracker/controller/dashboard_controller.dart';
import 'package:expense_tracker/models/dashboard_model.dart';
import 'package:expense_tracker/reusables/category_style.dart';
import 'package:expense_tracker/screens/transaction_list.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/widgets/add_transaction.dart';
import 'package:expense_tracker/widgets/app_bar.dart';
import 'package:expense_tracker/widgets/drawer.dart';
import 'package:expense_tracker/widgets/filter_chips.dart';
import 'package:expense_tracker/widgets/transaction_tile.dart';
import 'package:expense_tracker/widgets/trend_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final void Function(int) onTabSelected;
  const HomeScreen({super.key, required this.onTabSelected});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask((){
      ref.read(dashboardControllerProvider.notifier).getDashboard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: reusableDrawer(widget.onTabSelected, context),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: AppColors.gradient,
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () {
            addTransactionBottomSheet(context);
          },
          backgroundColor: Colors.transparent,
          child: Icon(Icons.add, color: AppColors.textPrimary),
        ),
      ),
      appBar: reusableAppBar("Cashbook"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(22),
          child: Consumer(
            builder: (context, ref, child) {
              final dashboardGate = ref.watch(dashboardControllerProvider);
              return dashboardGate.when(
                data: (dashboard) {
                  if (dashboard == null) {
                    return const Center(
                      child: Text("No Dashboard Data Available"),
                    );
                  }

                  return Column(
                    children: [
                      balanceCard(
                        dashboard!.totals.balance.toString(),
                        dashboard.totals.income.toString(),
                        dashboard.totals.expense.toString(),
                      ),
                      SizedBox(height: 28),
                      TrendBar(
                        values: [0.32, 0.62, 0.54, 0.82, 0.71, 0.21, 0.96],
                        lables: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
                        highlighIndex: DateTime.now().weekday,
                      ),
                      SizedBox(height: 28),
                      FilterChips(
                        selectedFilter: "All",
                        filters: ["All", "Income", "Expense", "Food", "Travel"],
                      ),
                      SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent Transactions",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TransactionList(
                                    onTabSelected: widget.onTabSelected,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "See all",
                              style: GoogleFonts.inter(
                                color: AppColors.blue,
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14),
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            final transaction = dashboard.transactions[index];
                            final style = CategoryTheme.forCategory(
                              transaction.category,
                            );
                            return transactionTile(transaction, style);
                          },
                        ),
                      ),
                    ],
                  );
                },
                error: (e, st) {
                  return Center(child: Text("Error loading dashboard data $e"));
                },
                loading: () {
                  return const CircularProgressIndicator(
                    color: AppColors.textPrimary,
                  );
                },
              );
            },
          ),
        ),
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
