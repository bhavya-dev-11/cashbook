class TransactionModel {
  final String id;
  final String userId;
  final String type;
  final String category;
  final int amount;
  final String note;
  final String date;
  final String createdAt;

  TransactionModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.category,
    required this.amount,
    required this.note,
    required this.date,
    required this.createdAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json){
    return TransactionModel(id: json["id"], 
    userId: json["userId"], 
    type: json["type"], 
    category: json["category"], 
    amount: json["amount"], 
    note: json["note"], 
    date: json["date"], 
    createdAt: json["createdAt"]);
  }
}