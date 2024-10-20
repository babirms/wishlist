import 'package:bloc/bloc.dart';
import 'package:wishlist/features/auth/data/exceptions/auth_exception.dart';
import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/features/auth/presentation/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final loggedUser =
          await authRepository.login(email: email, password: password);
      emit(LoginSuccess(loggedUser));
    } catch (e) {
      if (e is InvalidCredentialException) {
        emit(LoginInvalidCredentialsError(e.message));
      } else {
        emit(LoginError('Erro ao fazer login: $e'));
      }
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    try {
      await authRepository.sendPasswordResetEmail(email: email);
      emit(ResetPasswordSuccess('Email de recuperação enviado com sucesso!'));
    } catch (e) {
      emit(ResetPasswordError('Erro ao recuperar senha: $e'));
    }
  }
}
