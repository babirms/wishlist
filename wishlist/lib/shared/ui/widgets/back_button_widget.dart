import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final Function()? onPressed;

  const BackButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 36),
      child: InkWell(
        onTap: onPressed,
        child: const Icon(Icons.arrow_circle_left_outlined, size: 48),
      ),
    );
  }
}
