import 'dart:convert';

import 'package:expense_tracker/models/dashboard_model.dart';
import 'package:expense_tracker/models/dashboard_totals_model.dart';
import 'package:expense_tracker/models/dashboard_weekData_model.dart';
import 'package:expense_tracker/models/transaction_model.dart';
import 'package:expense_tracker/services/storage_service.dart';
import 'package:http/http.dart' as http;

class DashboardRepo {
  final String baseUrl = "http://10.0.2.2:5000";
  final storageService = StorageService();

  Future<String?> getToken() async{
    final token = await storageService.readToken();
    return token;
  }

  Future<DashboardModel> dashboardData() async{

    final token = getToken();

    final response = await http.get(
      Uri.parse("$baseUrl/api/dashboard"),
      headers: {
        "Content-type" : "application/json",
        "Authorization" : "Bearer $token",
      }
    );

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List<Map<String, dynamic>> weekJson = data['last7Days'];
      final List<Map<String, dynamic>> transactions = data['transactions'];
      return DashboardModel(totals: DashboardTotalsModel.fromJson(data['totals']), last7Days: weekJson.map((item) => DashboardWeekdataModel.fromJson(item)).toList(), transactions: transactions.map((item)=> TransactionModel.fromJson(item)).toList());
    }

    throw Exception("Error loading dashboard data");

  }

}