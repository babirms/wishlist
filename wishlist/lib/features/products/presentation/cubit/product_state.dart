import 'package:equatable/equatable.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';
import 'package:wishlist/features/wishlist/data/entities/wishlist_entity.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class UpdatedWishlistProductsSuccess extends ProductState {
  final WishlistEntity userWishlist;

  UpdatedWishlistProductsSuccess(this.userWishlist);

  @override
  List<Object?> get props => [userWishlist];
}

class ProductSuccess extends ProductState {
  final List<ProductEntity> allProductList;
  final WishlistEntity userWishlist;

  ProductSuccess(this.allProductList, this.userWishlist);

  @override
  List<Object?> get props => [allProductList, userWishlist];
}

class ProductError extends ProductState {
  final String errorMessage;

  ProductError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
