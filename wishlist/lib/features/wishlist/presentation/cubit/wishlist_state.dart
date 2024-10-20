import 'package:equatable/equatable.dart';
import 'package:wishlist/features/wishlist/data/entities/wishlist_entity.dart';

abstract class WishlistState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoadedSuccess extends WishlistState {
  final WishlistEntity wishlist;

  WishlistLoadedSuccess(this.wishlist);

  @override
  List<Object?> get props => [wishlist];
}

class WishlistUpdatedSuccess extends WishlistState {
  final WishlistEntity wishlist;

  WishlistUpdatedSuccess(this.wishlist);

  @override
  List<Object?> get props => [wishlist];
}

class WishlistError extends WishlistState {
  final String errorMessage;

  WishlistError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
