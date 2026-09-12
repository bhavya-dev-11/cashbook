import 'package:expense_tracker/reusables/category_style.dart';
import 'package:expense_tracker/widgets/app_bar.dart';
import 'package:expense_tracker/widgets/drawer.dart';
import 'package:expense_tracker/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  final void Function(int) onTabSelected;
  const TransactionList({super.key, required this.onTabSelected});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
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
      appBar: reusableAppBar("Transactions"),
      drawer: reusableDrawer(widget.onTabSelected, context),
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                final style = CategoryTheme.forCategory(
                  transaction['category'],
                );
                return transactionTile(transaction, style);
              },
            ),
          ),
        ),
      ),
    );
  }
}
