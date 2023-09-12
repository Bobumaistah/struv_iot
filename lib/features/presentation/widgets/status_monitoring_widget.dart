import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class StatusMonitoring extends StatelessWidget {
  const StatusMonitoring({
    super.key,
    required this.text,
    this.color = AppColors.contentColorGreen,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
