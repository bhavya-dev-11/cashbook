class DashboardTotalsModel {
  final double balance;
  final int income;
  final int expense;

  DashboardTotalsModel({
    required this.balance,
    required this.income,
    required this.expense,
  });

  factory DashboardTotalsModel.fromJson(Map<String, dynamic> json){
    return DashboardTotalsModel(balance: json["balance"], income: json["income"], expense: json["expense"]);
  }
}