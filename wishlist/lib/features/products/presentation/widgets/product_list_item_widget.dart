import 'package:flutter/material.dart';
import 'package:wishlist/shared/ui/custom_colors.dart';

class ProductListItemWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final bool isSelected;
  final String? subtitle;
  final bool? alreadyExists;

  const ProductListItemWidget(
      {super.key,
      this.onPressed,
      required this.title,
      required this.isSelected,
      this.subtitle,
      this.alreadyExists = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: Icon(
          isSelected ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          color: alreadyExists!
              ? CustomColors.terciaryGreen02
              : CustomColors.primaryPink,
        ),
      ),
    );
  }
}
