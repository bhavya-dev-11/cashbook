class DashboardWeekdataModel {
  final String date;
  final String label;
  final int income;
  final int expense;
  final int total;

  DashboardWeekdataModel({
    required this.date,
    required this.label,
    required this.income,
    required this.expense,
    required this.total,
  });

  factory DashboardWeekdataModel.fromJson(Map<String, dynamic> json){
    return DashboardWeekdataModel(date: json["date"], label: json["label"], income: json["income"], expense: json["expense"], total: json["total"]);
  }
}