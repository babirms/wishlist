import 'package:bloc/bloc.dart';
import 'package:wishlist/features/auth/data/exceptions/auth_exception.dart';
import 'package:wishlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:wishlist/features/auth/presentation/cubit/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepository;

  RegisterCubit(this.authRepository) : super(RegisterInitial());

  Future<void> register(
      {required String email,
      required String password,
      required String name}) async {
    emit(RegisterLoading());
    try {
      final registeredUser = await authRepository.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      emit(RegisterSuccess(registeredUser));
    } catch (e) {
      if (e is EmailAlreadyInUseException) {
        emit(RegisterEmailAlreadyInUseError(e.message));
      } else {
        emit(RegisterError(
            'Ocorreu um erro ao cadastrar o usuário. Por favor, tente novamente.'));
      }
    }
  }
}
