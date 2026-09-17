import 'package:expense_tracker/models/dashboard_model.dart';
import 'package:expense_tracker/provider/dashboard_repo_provider.dart';
import 'package:expense_tracker/repository/dashboard_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardController extends StateNotifier<AsyncValue<DashboardModel?>>{
  
  final DashboardRepo repo;

  DashboardController(this.repo) : super(const AsyncValue.data(null));

  Future<void> getDashboard() async{
    state = AsyncValue.loading();

    try{
      final data = await repo.dashboardData();
      state = AsyncValue.data(data);
    }
    catch(e, st){
      state = AsyncValue.error(e, st);
    }
  } 

}

final dashboardControllerProvider = StateNotifierProvider<DashboardController, AsyncValue<DashboardModel?>>((ref){
  return DashboardController(
    ref.watch(dashboardProvider)
  );
});