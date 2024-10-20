import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/features/splash/presentation/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthRepository authRepository;

  SplashCubit(this.authRepository) : super(SplashInitial());

  Future<void> loginSilently() async {
    emit(SplashLoading());
    try {
      final localUser = await authRepository.getLocalUser();

      /// Caso exista um usuário salvo localmente
      if (localUser != null) {
        emit(SplashLocalUserFound(localUser));
      }

      /// Caso não exista
      else {
        emit(SplashLocaNotlUserFound());
      }
    } catch (e) {
      emit(SplashError('Ocorreu um erro ao carregar os dados do usuário.'));
    }
  }
}
