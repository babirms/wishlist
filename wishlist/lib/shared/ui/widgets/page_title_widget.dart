import 'package:flutter/material.dart';

class PageTitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;

  const PageTitleWidget({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
        if (subtitle != null)
          Text(subtitle!, style: const TextStyle(fontSize: 20))
      ]),
    );
  }
}
