import 'dart:convert';

import 'package:expense_tracker/models/user_model.dart';
import 'package:expense_tracker/services/storage_service.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  final String baseUrl = "http://10.0.2.2:5000";
  final storageService = StorageService();

  Future<UserModel> login(String email, String password) async{

    final response = await http.post(
      Uri.parse("$baseUrl/api/auth/login"),
      headers: {
        "Content-type" : "application/json"
      },
      body: 
        jsonEncode({
          "email": email,
          "password": password
        })
      
    );

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      await storageService.storeToken(data['token']);
      return UserModel.fromJson(data['user']);
    }

    throw Exception("error while login");

  }

  Future<UserModel> signUp(String fullName, String email, String password) async{
    
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/signUp'),
      headers: {
        "Content-type" : "application/json",
      },
      body: jsonEncode({
        "fullName": fullName,
        "email": email,
        "password": password
      })
    );

    if(response.statusCode == 201){
      final data = jsonDecode(response.body);
      await storageService.storeToken(data['token']);
      return UserModel.fromJson(data['user']);
    }

    throw Exception("Error while signing up");

  }
}
