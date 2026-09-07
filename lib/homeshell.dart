import 'package:expense_tracker/bottom_nav.dart';
import 'package:expense_tracker/screens/home_screen.dart';
import 'package:expense_tracker/screens/profile_screen.dart';
import 'package:expense_tracker/screens/reports_screen.dart';
import 'package:expense_tracker/screens/transaction_list.dart';
import 'package:flutter/material.dart';

class Homeshell extends StatefulWidget {
  const Homeshell({super.key});

  @override
  State<Homeshell> createState() => _HomeshellState();
}

class _HomeshellState extends State<Homeshell> {

  int currentIndex = 1;

  void _onNavTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeScreen(onTabSelected: _onNavTap,),
          TransactionList(),
          ReportsScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CashbookBottomNav(currentIndex: currentIndex, onTap: _onNavTap),
    );
  }
}