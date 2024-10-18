import 'package:equatable/equatable.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductEntity> productList;

  ProductSuccess(this.productList);

  @override
  List<Object?> get props => [productList];
}

class ProductError extends ProductState {
  final String errorMessage;

  ProductError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
