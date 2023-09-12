import 'package:flutter/material.dart';
import 'package:struviot_apps/utils/app_colors.dart';

class DryenCardWidget extends StatelessWidget {
  const DryenCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(5),
      height: height * (26 / 100),
      decoration: BoxDecoration(
        color: AppColors.contentColorWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                width: (width * 0.25) - 5,
                decoration: BoxDecoration(
                  color: AppColors.pageBackground,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    scale: 3,
                    image: AssetImage('assets/pengering.png'),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Column(
                children: [
                  Container(
                    height: 60,
                    width: (width * 0.18) - 5,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/derajat.png',
                          scale: 5,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "40\u00B0C",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.contentColorWhite),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 60,
                    width: (width * 0.18) - 5,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/weight.png',
                          scale: 5,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "5.5 Kg",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.contentColorWhite),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pengering",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            height: 12,
                            width: 12,
                            decoration: const BoxDecoration(
                              color: AppColors.contentColorRed,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Stop",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
