import 'package:equatable/equatable.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductEntity> allProductList;
  final List<ProductEntity> userWishlistProductsList;

  ProductSuccess(this.allProductList, this.userWishlistProductsList);

  @override
  List<Object?> get props => [allProductList, userWishlistProductsList];
}

class ProductError extends ProductState {
  final String errorMessage;

  ProductError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
