import 'package:equatable/equatable.dart';
import 'package:wishlist/features/auth/data/entities/user_entity.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity user;

  LoginSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class LoginInvalidCredentialsError extends LoginState {
  final String errorMessage;

  LoginInvalidCredentialsError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class ResetPasswordLoading extends LoginState {}

class ResetPasswordSuccess extends LoginState {
  final String message;

  ResetPasswordSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ResetPasswordError extends LoginState {
  final String errorMessage;

  ResetPasswordError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
