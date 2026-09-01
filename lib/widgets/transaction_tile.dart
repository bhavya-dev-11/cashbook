import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';

Widget transactionTile(
    Map<String, dynamic> transaction,
    Map<String, dynamic> style,
  ) {
    final accentColor = style["color"] as Color;
    final amountText = transaction["isIncome"]
    ? "+₹${transaction["amount"]}"
    : "-₹${transaction["amount"]}";
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface2,
        border: Border.all(color: AppColors.border, width: 0.3),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: accentColor.withOpacity(0.3),
            ),
            child: Icon(style["icon"], color: accentColor),
          ),

          SizedBox(width: 12),

          ConstrainedBox(constraints: BoxConstraints(
            maxWidth: 170
          ),child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction["title"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 6,),
              Text(
                transaction["category"],
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
            ],
          ),),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                amountText,
                style: TextStyle(
                  color: transaction["isIncome"]
                      ? AppColors.income
                      : AppColors.expense,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 6,),
              Text(
                transaction["time"],
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }