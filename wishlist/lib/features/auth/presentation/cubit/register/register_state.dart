import 'package:equatable/equatable.dart';
import 'package:wishlist/features/auth/data/entities/user_entity.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final UserEntity user;

  RegisterSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class RegisterError extends RegisterState {
  final String errorMessage;

  RegisterError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
