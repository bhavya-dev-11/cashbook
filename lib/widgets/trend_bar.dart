import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendBar extends StatefulWidget {
  final List<double> values;
  final List<String> lables;
  final int highlighIndex;

  const TrendBar({
    super.key,
    required this.values,
    required this.lables,
    required this.highlighIndex,
  });

  @override
  State<TrendBar> createState() => _TrendBarState();
}

class _TrendBarState extends State<TrendBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Last 7 days",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w800,
                color: AppColors.textSecondary,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                Icon(Icons.arrow_drop_up_sharp, color: AppColors.income),
                Text(
                  "12.4%",
                  style: GoogleFonts.inter(
                    color: AppColors.income,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 160,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.values.length,
            itemBuilder: (context, index) {
              final value = widget.values[index];
              final label = widget.lables[index];
              final isHighlighted = widget.highlighIndex - 1 == index;
              return _buildBar(value, label, isHighlighted);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBar(double value, String label, bool isHighlighted) {
    return Padding(
      padding: EdgeInsets.only(right: 18),
      child: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              width: 36,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.surface2,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: 128 * value),
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeOutCubic,
                  builder: (context, animatedHeight, child) {
                    return AnimatedContainer(
                      duration: Duration.zero,
                      width: double.infinity,
                      height: animatedHeight,
                      decoration: BoxDecoration(
                        gradient: isHighlighted
                            ? AppColors.greenGradient
                            : AppColors.gradient,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            label,
            style: GoogleFonts.inter(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
