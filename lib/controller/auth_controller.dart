import 'package:expense_tracker/models/user_model.dart';
import 'package:expense_tracker/provider/auth_repo_provider.dart';
import 'package:expense_tracker/repository/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<AsyncValue<UserModel?>>{
  
  final AuthRepo repo;

  AuthController(this.repo) : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async{
    state = const AsyncValue.loading();

    try{
      final user = await repo.login(email, password);

      state = AsyncValue.data(user);
    }
    catch(e, st){
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signUp(String fullName, String email, String password) async{
    state = const AsyncValue.loading();

    try{
      final user = await repo.signUp(fullName, email, password);
      state = AsyncValue.data(user);
    }
    catch(e, st){
      state = AsyncValue.error(e, st);
    }
  }

}

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<UserModel?>>((ref){
  return AuthController(
    ref.watch(authRepoProvider)
  );
});