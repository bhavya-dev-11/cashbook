import 'package:expense_tracker/reusables/category_style.dart';
import 'package:expense_tracker/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

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
      "date": "Today",
      "time": "08:30 PM",
    },
    {
      "title": "Monthly Salary",
      "category": "salary",
      "amount": 65000,
      "isIncome": true,
      "date": "Yesterday",
      "time": "09:15 AM",
    },
    {
      "title": "Indigo Flight",
      "category": "travel",
      "amount": 5240,
      "isIncome": false,
      "date": "2 days ago",
      "time": "06:45 AM",
    },
    {
      "title": "Electricity Bill",
      "category": "bills",
      "amount": 1180,
      "isIncome": false,
      "date": "3 days ago",
      "time": "11:20 AM",
    },
    {
      "title": "Myntra Purchase",
      "category": "shopping",
      "amount": 2350,
      "isIncome": false,
      "date": "3 days ago",
      "time": "07:10 PM",
    },
    {
      "title": "Netflix Subscription",
      "category": "entertainment",
      "amount": 649,
      "isIncome": false,
      "date": "4 days ago",
      "time": "12:05 AM",
    },
    {
      "title": "Freelance Project",
      "category": "freelance",
      "amount": 12000,
      "isIncome": true,
      "date": "5 days ago",
      "time": "04:40 PM",
    },
    {
      "title": "Big Bazaar",
      "category": "groceries",
      "amount": 1840,
      "isIncome": false,
      "date": "6 days ago",
      "time": "10:55 AM",
    },
    {
      "title": "Apollo Pharmacy",
      "category": "health",
      "amount": 560,
      "isIncome": false,
      "date": "1 week ago",
      "time": "02:15 PM",
    },
    {
      "title": "House Rent",
      "category": "rent",
      "amount": 15000,
      "isIncome": false,
      "date": "1 week ago",
      "time": "01:00 PM",
    },
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                final style = CategoryTheme.forCategory(transaction['category']);
                return transactionTile(transaction, style);
              },
            ),
          ),
        ),
      ),
    );
  }

}
