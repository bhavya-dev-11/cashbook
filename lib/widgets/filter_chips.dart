import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterChips extends StatefulWidget {
  final List<String> filters;
  const FilterChips({super.key, required this.filters});

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {

  String _selectedFilter = "All";

  @override
  Widget build(BuildContext context) {
   return SizedBox(
    height: 40,
     child: ListView(
       scrollDirection: Axis.horizontal,
       children: widget.filters.map((filter) {
         return Padding(
           padding: const EdgeInsets.only(right: 8),
           child: GestureDetector(
            onTap: (){
              setState(() {
                _selectedFilter = filter;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 26),
              decoration: BoxDecoration(
                color: _selectedFilter == filter ? AppColors.violet : AppColors.surface2,
                border: Border.all(color: _selectedFilter == filter ? Colors.transparent : AppColors.border, width: 0.3),
                borderRadius: BorderRadius.circular(50)
              ),
              child: 
              Center(child: Text(filter, style: GoogleFonts.inter(color: _selectedFilter == filter ? AppColors.textPrimary : AppColors.textSecondary, fontSize: 16),),
            ),)
              
           )
         );
       }).toList(),
     ),
   );
  }
}
