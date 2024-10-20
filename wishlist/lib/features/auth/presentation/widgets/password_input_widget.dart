import 'package:flutter/material.dart';
import 'package:wishlist/shared/ui/widgets/default_input_widget.dart';

class PasswordInputWidget extends StatefulWidget {
  final String label;
  final String? placeholder;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function()? onUnfocus;

  const PasswordInputWidget({
    super.key,
    required this.label,
    this.placeholder,
    this.onChanged,
    required this.controller,
    this.validator,
    this.onUnfocus,
  });

  @override
  State<StatefulWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return DefaultInputwWidget(
      label: widget.label,
      controller: widget.controller,
      obscureText: isPasswordObscure,
      validator: widget.validator,
      onUnfocus: widget.onUnfocus,
      onChanged: widget.onChanged,
      suffixIcon: IconButton(
        icon: Icon(isPasswordObscure ? Icons.lock_outline : Icons.lock_open),
        onPressed: () {
          setState(() {
            isPasswordObscure = !isPasswordObscure;
          });
        },
      ),
    );
  }
}
