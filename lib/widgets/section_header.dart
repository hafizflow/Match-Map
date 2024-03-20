import 'package:flutter/material.dart';

// title header
class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
