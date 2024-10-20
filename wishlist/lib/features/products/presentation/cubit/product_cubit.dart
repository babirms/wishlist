import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/products/domain/repositories/product_repository.dart';
import 'package:wishlist/features/products/presentation/cubit/product_state.dart';
import 'package:wishlist/features/wishlist/data/entities/wishlist_entity.dart';
import 'package:wishlist/features/wishlist/domain/repositories/wishlist_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  final WishlistRepository wishlistRepository;

  ProductCubit(this.productRepository, this.wishlistRepository)
      : super(ProductInitial());

  Future<void> getProductsList({required String userId}) async {
    emit(ProductLoading());
    try {
      /// Recupera todos os produtos cadastrados (local ou remoto)
      final allProducts = await productRepository.getAllProducts();

      /// Recupera os itens da lista de desejos do usuário
      final userWishlist = await wishlistRepository.getWishlistFromUserId(
        userId: userId,
      );
      emit(ProductSuccess(allProducts, userWishlist));
    } catch (e) {
      emit(ProductError('Erro ao recuperar a lista de produtos: $e'));
    }
  }

  Future<void> addProductToWishlist({required WishlistEntity wishlist}) async {
    emit(ProductLoading());
    try {
      /// Atualiza lista de desejos atualizada do usuário
      await wishlistRepository.updateWishlist(wishlist: wishlist);

      emit(UpdatedWishlistProductsSuccess(wishlist));
    } catch (e) {
      emit(ProductError('Erro ao adicionar o item a lista de desejos: $e'));
    }
  }
}
