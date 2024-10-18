import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/products/domain/repositories/product_repository.dart';
import 'package:wishlist/features/products/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductCubit(this.productRepository) : super(ProductInitial());

  Future<void> getProductsList() async {
    emit(ProductLoading());
    try {
      final result = await productRepository.getAllProducts();
      emit(ProductSuccess(result));
    } catch (e) {
      emit(ProductError('Erro ao recuperar a lista de produtos: $e'));
    }
  }
}
