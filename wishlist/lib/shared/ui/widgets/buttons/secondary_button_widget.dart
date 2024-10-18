import 'package:flutter/material.dart';
import 'package:wishlist/shared/ui/custom_colors.dart';

class SecondaryButtonWidget extends StatefulWidget {
  final Function()? onPressed;
  final String label;
  final Color? color;

  const SecondaryButtonWidget({
    super.key,
    this.onPressed,
    required this.label,
    this.color,
  });

  @override
  State<StatefulWidget> createState() => _SecondaryButtonWidgetWidgetState();
}

class _SecondaryButtonWidgetWidgetState extends State<SecondaryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: const BorderSide(color: CustomColors.primaryPink, width: 2),
      ),
      child: Text(
        widget.label,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: widget.color ?? CustomColors.primaryPink),
      ),
    );
  }
}
