import 'package:flutter/material.dart';
import 'package:wishlist/shared/ui/custom_colors.dart';
import 'package:wishlist/shared/ui/widgets/warnings/warning_widget.dart';

class EmptyWishlistWidget extends StatelessWidget {
  final Function() onAddItemPressed;

  const EmptyWishlistWidget({super.key, required this.onAddItemPressed});

  @override
  Widget build(BuildContext context) {
    return WarningWidget(
      icon: const Icon(
        Icons.favorite_outline_rounded,
        color: CustomColors.terciaryGreen02,
        size: 100,
      ),
      title: 'Sua lista está vazia :(',
      message:
          'Você ainda não possui nenhum item adicionado em sua lista de desejos.',
      onPrimaryTapped: onAddItemPressed,
      buttonText: 'Adicionar itens',
    );
  }
}
