import 'package:flutter/material.dart';

class DefaultInputwWidget extends StatefulWidget {
  final String label;
  final String? placeholder;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Function()? onUnfocus;

  const DefaultInputwWidget(
      {super.key,
      required this.label,
      this.placeholder,
      this.onChanged,
      required this.controller,
      this.validator,
      this.suffixIcon,
      this.obscureText = false,
      this.keyboardType,
      this.onUnfocus});
  @override
  State<StatefulWidget> createState() => _DefaultInputwWidgetState();
}

class _DefaultInputwWidgetState extends State<DefaultInputwWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: TextFormField(
        onTapOutside: (event) {
          if (widget.onUnfocus != null) {
            widget.onUnfocus!();
          }

          FocusManager.instance.primaryFocus?.unfocus();
        },
        controller: widget.controller,
        validator: widget.validator,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.placeholder,
            border: const OutlineInputBorder(),
            suffixIcon: widget.suffixIcon),
        obscureText: widget.obscureText!,
      ),
    );
  }
}
