import 'package:flutter/material.dart';
import 'package:struviot_apps/utils/app_colors.dart';

class AddNewCardWidget extends StatelessWidget {
  const AddNewCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * (26 / 100),
      decoration: BoxDecoration(
        color: AppColors.contentColorWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_circle_sharp,
              size: 60,
              color: AppColors.primary,
            ),
            const SizedBox(height: 12),
            Text(
              "Tambah\nAlat",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.primary),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
