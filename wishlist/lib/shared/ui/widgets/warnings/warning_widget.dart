import 'package:flutter/material.dart';
import 'package:wishlist/shared/ui/widgets/buttons/primary_button_widget.dart';

class WarningWidget extends StatelessWidget {
  final Icon icon;
  final String title;
  final String message;
  final String? buttonText;
  final Function()? onPrimaryTapped;

  const WarningWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.onPrimaryTapped,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(title,
              style:
                  const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 24),
          if (buttonText != null && onPrimaryTapped != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PrimaryButtonWidget(
                  label: buttonText!, onPressed: onPrimaryTapped),
            ),
        ],
      ),
    );
  }
}
