import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLocalUserFound extends SplashState {
  SplashLocalUserFound();

  @override
  List<Object?> get props => [];
}

class SplashLocaNotlUserFound extends SplashState {
  SplashLocaNotlUserFound();

  @override
  List<Object?> get props => [];
}

class SplashError extends SplashState {
  final String errorMessage;

  SplashError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
