import 'package:expense_tracker/models/dashboard_totals_model.dart';
import 'package:expense_tracker/models/dashboard_weekData_model.dart';
import 'package:expense_tracker/models/transaction_model.dart';

class DashboardModel {
  final DashboardTotalsModel totals;
  final List<DashboardWeekdataModel> last7Days;
  final List<TransactionModel> transactions;

  DashboardModel({
    required this.totals,
    required this.last7Days,
    required this.transactions
  });
}