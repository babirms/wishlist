import 'package:equatable/equatable.dart';

abstract class LogoutState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final String message;

  LogoutSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class LogoutError extends LogoutState {
  final String errorMessage;

  LogoutError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
