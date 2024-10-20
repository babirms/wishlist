import 'package:equatable/equatable.dart';
import 'package:wishlist/features/auth/data/entities/user_entity.dart';

abstract class SplashState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLocalUserFound extends SplashState {
  final UserEntity user;

  SplashLocalUserFound(this.user);

  @override
  List<Object?> get props => [user];
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
