import 'package:flutter/material.dart';

class PageTitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double? titleSize;
  final double? subtitleSize;

  const PageTitleWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.titleSize,
    this.subtitleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: TextStyle(
              fontSize: titleSize ?? 48,
              fontWeight: FontWeight.bold,
              letterSpacing: -2),
        ),
        if (subtitle != null)
          Text(subtitle!, style: TextStyle(fontSize: subtitleSize ?? 20))
      ]),
    );
  }
}
