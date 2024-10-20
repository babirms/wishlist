import 'package:bloc/bloc.dart';
import 'package:wishlist/features/products/data/entities/product_entity.dart';
import 'package:wishlist/features/wishlist/data/entities/wishlist_entity.dart';
import 'package:wishlist/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:wishlist/features/wishlist/presentation/cubit/wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepository wishlistRepository;

  WishlistCubit(this.wishlistRepository) : super(WishlistInitial());

  Future<void> getWishlist({required String userId}) async {
    emit(WishlistLoading());
    try {
      final wishlist =
          await wishlistRepository.getWishlistFromUserId(userId: userId);

      emit(WishlistLoadedSuccess(wishlist));
    } catch (e) {
      emit(WishlistError('Erro ao recuperar a lista de desejos.'));
    }
  }

  Future<void> removeProductsFrom({
    required WishlistEntity wishlist,
    required List<ProductEntity> updatedProductList,
  }) async {
    emit(WishlistLoading());
    try {
      wishlist.productList
          .removeWhere((product) => updatedProductList.contains(product));

      await wishlistRepository.updateWishlist(wishlist: wishlist);

      emit(WishlistUpdatedSuccess(wishlist));
    } catch (e) {
      emit(WishlistError('Erro ao recuperar a lista de desejos.'));
    }
  }
}
