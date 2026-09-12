import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PiechartOnly extends StatefulWidget {
  final List<Map<String, dynamic>> categoryBreakdown;
  const PiechartOnly({super.key, required this.categoryBreakdown});

  @override
  State<PiechartOnly> createState() => _PiechartOnlyState();
}



class _PiechartOnlyState extends State<PiechartOnly> {

  late List<Map<String, dynamic>> _categoryBreakdown = widget.categoryBreakdown;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: 180,
      child: PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 52,
          sections: _categoryBreakdown.map((category) {
            return PieChartSectionData(
              color: category["color"],
              radius: 28,
            );
          }).toList(),
        ),
      ),
    );
  }
}
