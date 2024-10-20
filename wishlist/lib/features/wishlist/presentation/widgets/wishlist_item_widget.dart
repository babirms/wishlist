import 'package:flutter/material.dart';
import 'package:wishlist/shared/ui/custom_colors.dart';

class WishlistItemWidget extends StatefulWidget {
  final String title;
  final bool isSelected;
  final Function()? onRemovePressed;

  const WishlistItemWidget({
    super.key,
    required this.title,
    required this.isSelected,
    this.onRemovePressed,
  });

  @override
  State<StatefulWidget> createState() => _WishlistItemWidgetState();
}

class _WishlistItemWidgetState extends State<WishlistItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onRemovePressed,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            leading: const Icon(
              Icons.favorite_rounded,
              color: CustomColors.terciaryGreen02,
            ),
            tileColor: widget.onRemovePressed != null
                ? widget.isSelected
                    ? CustomColors.secondaryPink02
                    : null
                : null,
            title: Text(widget.title),
            trailing: widget.onRemovePressed != null
                ? Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red[900],
                  )
                : null,
          ),
        ),
        const Divider()
      ],
    );
  }
}
