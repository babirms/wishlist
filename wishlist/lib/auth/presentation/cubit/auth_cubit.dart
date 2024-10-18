import 'package:bloc/bloc.dart';
import 'package:wishlist/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await authRepository.login(email: email, password: password);
      emit(AuthSuccess('Login realizado com sucesso!'));
    } catch (e) {
      emit(AuthError('Erro ao fazer login: $e'));
    }
  }

  Future<void> register(
      {required String email,
      required String password,
      required String name}) async {
    emit(AuthLoading());
    try {
      await authRepository.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      emit(AuthSuccess('Usuário cadastrado com sucesso!'));
    } catch (e) {
      emit(AuthError('Erro ao cadastrar usuário: $e'));
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(AuthLoading());
    try {
      await authRepository.sendPasswordResetEmail(email: email);
      emit(AuthSuccess('Email de recuperação enviado com sucesso!'));
    } catch (e) {
      emit(AuthError('Erro ao recuperar senha: $e'));
    }
  }
}
