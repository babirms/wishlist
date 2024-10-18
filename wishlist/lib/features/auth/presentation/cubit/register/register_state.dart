import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;

  RegisterSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class RegisterError extends RegisterState {
  final String errorMessage;

  RegisterError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
