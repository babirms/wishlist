import 'package:wishlist/features/products/data/entities/product_entity.dart';
import 'package:wishlist/features/wishlist/data/datasources/wishlist_remote_datasource.dart';
import 'package:wishlist/features/wishlist/data/entities/wishlist_entity.dart';

class WishlistRepository {
  final WishlistRemoteDataSource remoteDataSource;

  WishlistRepository({required this.remoteDataSource});

  Future<WishlistEntity> getWishlistFromUserId({required String userId}) async {
    return await remoteDataSource.getWishlistFromUserId(userId: userId);
  }

  Future<WishlistEntity> createWishlist(
      {required String userId, List<ProductEntity>? productList}) async {
    return await remoteDataSource.createWishlist(
        userId: userId, productList: productList);
  }

  Future<void> updateWishlist({required WishlistEntity wishlist}) async {
    return await remoteDataSource.updateWishlist(wishlist: wishlist);
  }
}
