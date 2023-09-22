import 'package:flutter/material.dart';
import 'package:struviot_apps/features/presentation/widgets/dryen_card_widget.dart';
import 'package:struviot_apps/utils/app_colors.dart';

import '../../mqtt_services/mqtt_service.dart';
import '../widgets/add_new_card_widget.dart';
import '../widgets/reactor_card_widget.dart';
import '../widgets/sort_card_widget.dart';
import '../widgets/status_monitoring_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MQTTClientManager mqttClientManager = MQTTClientManager();

  @override
  void initState() {
    super.initState();
    mqttClientManager.connect();
  }

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
                ValueListenableBuilder<String>(
                  builder: (_, value, child) {
                    return SizedBox(
                      width: width * 0.45,
                      child: ReactorCardWidget(
                        statusColor: AppColors.contentColorYellow,
                        status: value,
                      ),
                    );
                  },
                  valueListenable: mqttClientManager.reactorStatus,
                ),
                const Spacer(),
                ValueListenableBuilder<double>(
                  builder: (_, value, child) {
                    return SizedBox(
                      width: width * 0.45,
                      child: SortCardWidget(
                        statusColor: AppColors.contentColorGreen,
                        data: value.toStringAsFixed(1),
                      ),
                    );
                  },
                  valueListenable: mqttClientManager.sortWeight,
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: width * 0.45,
                  child: DryenCardWidget(
                    tempWiget: ValueListenableBuilder<double>(
                      builder: (_, value, child) {
                        return Text(
                          "${value.toStringAsFixed(0)}\u00B0C",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.contentColorWhite),
                        );
                      },
                      valueListenable: mqttClientManager.dryenTemp,
                    ),
                    weightWiget: ValueListenableBuilder<double>(
                      builder: (_, value, child) {
                        return Text(
                          "${value.toStringAsFixed(1)} Kg",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.contentColorWhite),
                        );
                      },
                      valueListenable: mqttClientManager.dryenWeight,
                    ),
                  ),
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
