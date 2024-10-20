import 'package:flutter/material.dart';

class DefaultListTitleWidget extends StatelessWidget {
  final Function()? onPressed;
  final Widget? leading;
  final Widget? trailing;
  final String title;
  final String? subtitle;
  final Color? tileColor;
  final bool? hasDivider;
  final EdgeInsetsGeometry? contentPadding;

  const DefaultListTitleWidget({
    required this.title,
    super.key,
    this.onPressed,
    this.leading,
    this.trailing,
    this.subtitle,
    this.tileColor,
    this.hasDivider = false,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: ListTile(
              contentPadding:
                  contentPadding ?? const EdgeInsets.symmetric(horizontal: 8),
              leading: leading,
              tileColor: tileColor,
              title: Text(title),
              trailing: trailing),
        ),
        if (hasDivider!) const Divider()
      ],
    );
  }
}
