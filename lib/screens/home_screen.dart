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
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  final void Function(int) onTabSelected;
  const HomeScreen({super.key, required this.onTabSelected});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> transactions = [
    {
      "title": "Zomato Order",
      "category": "food",
      "amount": 420,
      "isIncome": false,
      "date": "10 Sep 2026",
      "time": "08:30 PM",
    },
    {
      "title": "Monthly Salary",
      "category": "salary",
      "amount": 65000,
      "isIncome": true,
      "date": "09 Sep 2026",
      "time": "09:15 AM",
    },
    {
      "title": "Indigo Flight",
      "category": "travel",
      "amount": 5240,
      "isIncome": false,
      "date": "08 Sep 2026",
      "time": "06:45 AM",
    },
    {
      "title": "Electricity Bill",
      "category": "bills",
      "amount": 1180,
      "isIncome": false,
      "date": "07 Sep 2026",
      "time": "11:20 AM",
    },
    {
      "title": "Myntra Purchase",
      "category": "shopping",
      "amount": 2350,
      "isIncome": false,
      "date": "07 Sep 2026",
      "time": "07:10 PM",
    },
    {
      "title": "Netflix Subscription",
      "category": "entertainment",
      "amount": 649,
      "isIncome": false,
      "date": "06 Sep 2026",
      "time": "12:05 AM",
    },
    {
      "title": "Freelance Project",
      "category": "freelance",
      "amount": 12000,
      "isIncome": true,
      "date": "05 Sep 2026",
      "time": "04:40 PM",
    },
    {
      "title": "Big Bazaar",
      "category": "groceries",
      "amount": 1840,
      "isIncome": false,
      "date": "04 Sep 2026",
      "time": "10:55 AM",
    },
    {
      "title": "Apollo Pharmacy",
      "category": "health",
      "amount": 560,
      "isIncome": false,
      "date": "03 Sep 2026",
      "time": "02:15 PM",
    },
    {
      "title": "House Rent",
      "category": "rent",
      "amount": 15000,
      "isIncome": false,
      "date": "03 Sep 2026",
      "time": "01:00 PM",
    },
  ];

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
          child: Column(
            children: [
              balanceCard("48,320.75", "75,000", "24,180"),
              SizedBox(height: 28),
              TrendBar(
                values: [0.32, 0.62, 0.54, 0.82, 0.71, 0.21, 0.96],
                lables: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
                highlighIndex: DateTime.now().weekday,
              ),
              SizedBox(height: 28),
              FilterChips(
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
                          builder: (context) => TransactionList(onTabSelected: widget.onTabSelected,),
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
                    final transaction = transactions[index];
                    final style = CategoryTheme.forCategory(
                      transaction['category'],
                    );
                    return transactionTile(transaction, style);
                  },
                ),
              ),
            ],
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
