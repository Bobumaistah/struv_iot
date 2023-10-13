import 'package:flutter/material.dart';
import 'base_card_widget.dart';

import '../../../utils/app_colors.dart';

class ReactorCardWidget extends StatelessWidget {
  const ReactorCardWidget({
    super.key,
    required this.name,
    required this.onLongPress,
    required this.value,
    required this.statusColor,
  });

  final String name;
  final String value;
  final Color statusColor;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return BaseCardWidget(
      onLongPress: onLongPress,
      hardwareName: name,
      widget: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/valve.png',
              scale: 3.8,
              color: AppColors.secondary,
            ),
            const SizedBox(width: 10),
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.secondary),
            ),
          ],
        ),
      ),
      statusColor: statusColor,
    );

    // return Material(
    //   color: AppColors.contentColorWhite,
    //   borderRadius: BorderRadius.circular(10),
    //   child: InkWell(
    //     borderRadius: BorderRadius.circular(10),
    //     onLongPress: onLongPress,
    //     child: Container(
    //       padding: const EdgeInsets.all(5),
    //       height: height * (26 / 100),
    //       child: Column(
    //         children: [
    //           Container(
    //             height: 130,
    //             decoration: BoxDecoration(
    //               color: AppColors.pageBackground,
    //               borderRadius: BorderRadius.circular(8),
    //               image: const DecorationImage(
    //                 scale: 3,
    //                 image: AssetImage('assets/reaktor.png'),
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(top: 10),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 5),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             name,
    //                             style: Theme.of(context)
    //                                 .textTheme
    //                                 .titleLarge!
    //                                 .copyWith(fontSize: 16),
    //                           ),
    //                           const SizedBox(height: 5),
    //                           Row(
    //                             children: [
    //                               Container(
    //                                 height: 12,
    //                                 width: 12,
    //                                 decoration: const BoxDecoration(
    //                                   color: AppColors.contentColorYellow,
    //                                   shape: BoxShape.circle,
    //                                 ),
    //                               ),
    //                               const SizedBox(width: 6),
    //                               Text(
    //                                 "Proses",
    //                                 style: Theme.of(context)
    //                                     .textTheme
    //                                     .titleSmall!
    //                                     .copyWith(fontSize: 12),
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                       const SizedBox(width: 6),
    //                       Container(
    //                         height: 40,
    //                         width: (width * 0.21) - 5,
    //                         padding: const EdgeInsets.symmetric(horizontal: 4),
    //                         decoration: BoxDecoration(
    //                           color: AppColors.primary,
    //                           borderRadius: BorderRadius.circular(6),
    //                         ),
    //                         child: Row(
    //                           crossAxisAlignment: CrossAxisAlignment.center,
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             Image.asset(
    //                               'assets/valve.png',
    //                               scale: 3,
    //                             ),
    //                             const SizedBox(width: 5),
    //                             Text(
    //                               "ON",
    //                               style: Theme.of(context)
    //                                   .textTheme
    //                                   .bodySmall!
    //                                   .copyWith(
    //                                       color: AppColors.contentColorWhite),
    //                             ),
    //                           ],
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //                 const SizedBox(height: 10),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
