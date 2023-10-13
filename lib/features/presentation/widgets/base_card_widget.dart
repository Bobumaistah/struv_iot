import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class BaseCardWidget extends StatelessWidget {
  const BaseCardWidget({
    super.key,
    required this.onLongPress,
    required this.hardwareName,
    required this.widget,
    required this.statusColor,
  });

  final Function() onLongPress;
  final String hardwareName;
  final Widget widget;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.contentColorWhite,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onLongPress: onLongPress,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: AppColors.secondary,
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Text(
                hardwareName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: AppColors.secondary),
              ),
              const SizedBox(height: 10),
              widget
            ],
          ),
        ),
      ),
    );
  }
}
