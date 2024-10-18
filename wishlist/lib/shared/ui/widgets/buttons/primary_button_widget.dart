import 'package:flutter/material.dart';
import 'package:wishlist/shared/ui/custom_colors.dart';

class PrimaryButtonWidget extends StatefulWidget {
  final Function()? onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? labelColor;

  const PrimaryButtonWidget({
    super.key,
    this.onPressed,
    required this.label,
    this.backgroundColor,
    this.labelColor,
  });

  @override
  State<StatefulWidget> createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: widget.backgroundColor ?? CustomColors.primaryPink),
      child: Text(
        widget.label,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: widget.labelColor ?? Colors.white.withOpacity(0.9)),
      ),
    );
  }
}
