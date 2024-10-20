import 'package:flutter/material.dart';
import 'package:wishlist/features/products/presentation/widgets/product_list_item_widget.dart';

class ProductOnWishlistWidget extends StatelessWidget {
  final String title;

  const ProductOnWishlistWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ProductListItemWidget(
        title: title,
        isSelected: true,
        alreadyExists: true,
        subtitle: 'Este produto já está em sua lista de desejos :)');
  }
}
