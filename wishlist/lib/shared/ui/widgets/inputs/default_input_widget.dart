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
  final String? forceErrorText;

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
      this.forceErrorText,
      this.onUnfocus});
  @override
  State<StatefulWidget> createState() => _DefaultInputwWidgetState();
}

class _DefaultInputwWidgetState extends State<DefaultInputwWidget> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.onUnfocus != null) {
      _focusNode.addListener(() {
        if (!_focusNode.hasFocus) {
          widget.onUnfocus?.call();
        }
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: TextFormField(
        forceErrorText: widget.forceErrorText,
        focusNode: _focusNode,
        onTapOutside: (event) => _focusNode.unfocus(),
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
