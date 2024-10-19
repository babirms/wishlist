import 'package:bloc/bloc.dart';
import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/features/auth/presentation/cubit/logout/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepository authRepository;

  LogoutCubit(this.authRepository) : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      await authRepository.logout();
      emit(LogoutSuccess('Usuário deslogado com sucesso!'));
    } catch (e) {
      emit(LogoutError(
          'Ocorreu um erro ao deslogar o usuário. Por favor, tente novamente mais tarde.'));
    }
  }
}
