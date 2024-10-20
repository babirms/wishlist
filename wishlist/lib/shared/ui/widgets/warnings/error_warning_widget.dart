import 'package:flutter/material.dart';
import 'package:wishlist/shared/ui/custom_colors.dart';
import 'package:wishlist/shared/ui/widgets/warnings/warning_widget.dart';

class ErrorWarningWidget extends StatelessWidget {
  const ErrorWarningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const WarningWidget(
      icon: Icon(
        Icons.error_outline_rounded,
        color: CustomColors.warning,
        size: 100,
      ),
      title: 'Ops! Ocorreu um erro :(',
      message:
          'Ocorreu um erro ao realizar a operação. Por favor, tente novamente mais tarde.',
    );
  }
}
