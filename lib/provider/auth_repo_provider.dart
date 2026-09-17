
import 'package:expense_tracker/models/user_model.dart';
import 'package:expense_tracker/repository/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepoProvider = Provider<AuthRepo>((ref){
  return AuthRepo();
}); 