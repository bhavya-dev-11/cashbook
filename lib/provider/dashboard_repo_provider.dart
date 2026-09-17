import 'package:expense_tracker/models/dashboard_model.dart';
import 'package:expense_tracker/repository/dashboard_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardProvider = Provider<DashboardRepo>((ref){
  return DashboardRepo();
});