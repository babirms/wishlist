import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;

  LoginSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError(this.errorMessage);

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
