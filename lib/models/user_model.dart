class UserModel{
  final String id;
  final String fullName;
  final String email;
  final String avatar;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.avatar
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(id: json['id'], fullName: json['fullName'], email: json['email'], avatar: json['avatar']);
  }
}