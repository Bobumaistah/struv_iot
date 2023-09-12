import 'package:flutter/material.dart';
import 'package:struviot_apps/utils/app_colors.dart';

import '../widgets/add_new_card_widget.dart';
import '../widgets/dryen_card_widget.dart';
import '../widgets/reactor_card_widget.dart';
import '../widgets/sort_card_widget.dart';
import '../widgets/status_monitoring_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        toolbarHeight: 90,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "StruvIoT",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: 3),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hardware Monitoring",
                  style: Theme.of(context).textTheme.bodyMedium!,
                ),
                const Spacer(),
                Text(
                  "Connected to “ssid_name”",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: Column(
          children: [
            const Row(
              children: [
                StatusMonitoring(
                  text: "Finish",
                ),
                StatusMonitoring(
                  text: "On Proses",
                  color: AppColors.contentColorYellow,
                ),
                StatusMonitoring(
                  text: "Stop",
                  color: AppColors.contentColorRed,
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                SizedBox(
                  width: width * 0.45,
                  child: const ReactorCardWidget(
                    statusColor: AppColors.contentColorYellow,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: width * 0.45,
                  child: const SortCardWidget(
                    statusColor: AppColors.contentColorGreen,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: width * 0.45,
                  child: const DryenCardWidget(),
                ),
                const Spacer(),
                SizedBox(
                  width: width * 0.45,
                  child: const AddNewCardWidget(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
