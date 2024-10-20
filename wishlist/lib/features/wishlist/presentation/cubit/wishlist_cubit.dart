import 'package:bloc/bloc.dart';
import 'package:wishlist/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:wishlist/features/wishlist/presentation/cubit/wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepository wishlistRepository;

  WishlistCubit(this.wishlistRepository) : super(WishlistInitial());

  Future<void> getWishlist({required String userId}) async {
    emit(WishlistLoading());
    final wishlist =
        await wishlistRepository.getWishlistFromUserId(userId: userId);
    if (wishlist != null) {
      emit(WishlistLoadedSuccess(wishlist));
    } else {
      emit(WishlistError('Erro ao recuperar a lista de desejos.'));
    }
  }

  Future<void> updateWishlist({required String userId}) async {
    emit(WishlistLoading());
    final wishlist =
        await wishlistRepository.getWishlistFromUserId(userId: userId);
    if (wishlist != null) {
      emit(WishlistUpdatedSuccess(wishlist));
    } else {
      emit(WishlistError('Erro ao recuperar a lista de desejos.'));
    }
  }
}
