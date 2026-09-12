import 'package:expense_tracker/widgets/app_bar.dart';
import 'package:expense_tracker/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  final void Function(int) onTabSelected;
  const ReportsScreen({super.key, required this.onTabSelected});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppBar("Reports"),
      drawer: reusableDrawer(widget.onTabSelected, context),
    );
  }
}