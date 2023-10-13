import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:ndialog/ndialog.dart';
import '../../data/models/hardware_model.dart';
import '../bloc/mqtt/mqtt_handler_bloc.dart';
import '../../../utils/app_colors.dart';
import '../bloc/dropdown_cubit.dart';
import '../bloc/hardware_bloc.dart';
import '../widgets/custom_input_id.dart';
import '../widgets/custom_outline_dropdown.dart';
import '../widgets/dryen_card_widget.dart';
import '../widgets/reactor_card_widget.dart';
import '../widgets/sort_card_widget.dart';
import '../widgets/status_monitoring_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final inputIdOnecontroller = TextEditingController(text: '');
  final inputIdTwocontroller = TextEditingController(text: '');

  final Map<String, dynamic> mqttPayload = {};

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        context.read<HardwareBloc>().add(GetAllHardwareEvent());
        context.read<MqttHandlerBloc>().add(MqttConnectionEvent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.pageBackground,
      appBar: buildAppBarWidget(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Column(
          children: [
            Row(
              children: [
                const StatusMonitoring(
                  text: "Finish",
                ),
                const StatusMonitoring(
                  text: "On Proses",
                  color: AppColors.contentColorYellow,
                ),
                const StatusMonitoring(
                  text: "Stop",
                  color: AppColors.contentColorRed,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => chooseHadware(),
                  icon: const Icon(Icons.add_box_rounded),
                )
              ],
            ),
            const SizedBox(height: 10),
            BlocConsumer<HardwareBloc, HardwareState>(
              listener: (context, state) {
                if (state is HardwareCreatedSuccessState ||
                    state is RemovedHardwareState) {
                  context.read<HardwareBloc>().add(GetAllHardwareEvent());
                  context.read<MqttHandlerBloc>().add(MqttConnectionEvent());
                }
              },
              builder: (context, state) {
                if (state is HardwareListDataState) {
                  return buildHardwareGrid(state);
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBarWidget(BuildContext context) {
    return AppBar(
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
    );
  }

  Widget buildHardwareGrid(HardwareListDataState state) {
    return Expanded(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) => buildHardwareCard(
          state.datas[index],
          index,
        ),
        itemCount: state.datas.length,
      ),
    );
  }

  Widget buildHardwareCard(HardwareModel hardware, int index) {
    final hardwareName = hardware.type;

    final String devOneID = hardware.devOneID.toString();
    final String devTwoID = hardware.devTwoID.toString();

    switch (hardwareName) {
      case "Reaktor":
        return BlocListener<MqttHandlerBloc, MqttHandlerState>(
          listener: (context, state) {
            if (state is MqttHandlerLoaded) {
              final client = state.mqttClient;

              client.subscribe(devOneID, MqttQos.atMostOnce);

              client.updates?.listen((
                List<MqttReceivedMessage<MqttMessage?>>? c,
              ) {
                final recMess = c![0].payload as MqttPublishMessage;

                final pt = MqttPublishPayload.bytesToStringAsString(
                  recMess.payload.message,
                );

                if (c[0].topic == devOneID) {
                  setState(() {
                    mqttPayload[devOneID] = pt;
                  });
                }
              });
            }
          },
          child: ReactorCardWidget(
            statusColor: AppColors.contentColorRed,
            name: hardwareName.toString(),
            value: mqttPayload[devOneID] ?? 'OFF',
            onLongPress: () => removeAndEditHardwareDialog(index),
          ),
        );
      case "Pengering":
        return BlocListener<MqttHandlerBloc, MqttHandlerState>(
          listener: (context, state) {
            if (state is MqttHandlerLoaded) {
              final client = state.mqttClient;

              client.subscribe(devOneID, MqttQos.atMostOnce);

              if (devTwoID != '') {
                client.subscribe(devTwoID, MqttQos.atMostOnce);
              }

              client.updates?.listen((
                List<MqttReceivedMessage<MqttMessage?>>? c,
              ) {
                final recMess = c![0].payload as MqttPublishMessage;

                final pt = MqttPublishPayload.bytesToStringAsString(
                  recMess.payload.message,
                );

                if (c[0].topic == devOneID) {
                  setState(() {
                    mqttPayload[devOneID] = pt;
                  });
                }
                if (c[0].topic == devTwoID) {
                  setState(() {
                    mqttPayload[devTwoID] = pt;
                  });
                }
              });
            }
          },
          child: DryenCardWidget(
            statusColor: AppColors.contentColorRed,
            weight: mqttPayload[devOneID] ?? '0',
            temp: mqttPayload[devTwoID] ?? '0',
            name: hardwareName.toString(),
            onLongPress: () => removeAndEditHardwareDialog(index),
          ),
        );
      case "Penyaring":
        return BlocListener<MqttHandlerBloc, MqttHandlerState>(
          listener: (context, state) {
            if (state is MqttHandlerLoaded) {
              final client = state.mqttClient;

              client.subscribe(devOneID, MqttQos.atMostOnce);

              client.updates?.listen((
                List<MqttReceivedMessage<MqttMessage?>>? c,
              ) {
                final recMess = c![0].payload as MqttPublishMessage;

                final pt = MqttPublishPayload.bytesToStringAsString(
                  recMess.payload.message,
                );

                if (c[0].topic == devOneID) {
                  setState(() {
                    mqttPayload[devOneID] = pt;
                  });
                }
              });
            }
          },
          child: SortCardWidget(
            statusColor: AppColors.contentColorRed,
            weight: mqttPayload[devOneID] ?? '0',
            name: hardwareName.toString(),
            onLongPress: () => removeAndEditHardwareDialog(index),
          ),
        );
      default:
        return Container();
    }
  }

  void chooseHadware() {
    DialogBackground(
      blur: 2,
      dialog: BlocBuilder<SetValueDropdownCubit, String>(
        builder: (context, state) {
          return NAlertDialog(
            title: const Center(
              child: Text(
                "Pilih Hardware",
              ),
            ),
            dialogStyle: DialogStyle(
              backgroundColor: AppColors.contentColorWhite,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              contentTextStyle: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              ),
              titlePadding: const EdgeInsets.only(
                top: 20,
              ),
            ),
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomOutlineDropdown(
                    value: state,
                    items: const [
                      "Reaktor",
                      "Penyaring",
                      "Pengering",
                    ],
                    onChanged: (String? value) {
                      context
                          .read<SetValueDropdownCubit>()
                          .updateValue(value.toString());
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomInputId(controller: inputIdOnecontroller),
                  if (state == "Pengering") const SizedBox(height: 10),
                  if (state == "Pengering")
                    CustomInputId(controller: inputIdTwocontroller),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: saveHardware,
                child: const Text("Simpan"),
              ),
              TextButton(
                child: const Text("Tutup"),
                onPressed: () {
                  inputIdOnecontroller.text = '';
                  inputIdTwocontroller.text = '';
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      ),
    ).show(context);
  }

  void removeAndEditHardwareDialog(int index) {
    DialogBackground(
        blur: 2,
        dialog: NAlertDialog(
          title: Center(
            child: Text(
              "Konfirmasi Tindakan",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          content: Text(
            "Anda yakin ingin mengedit atau menghapus\n item ini?",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.secondary,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Hapus"),
              onPressed: () {
                context.read<HardwareBloc>().add(RemoveHardwareEvent(index));
                Navigator.pop(context);
              },
            ),
            TextButton(
                child: const Text("Edit"),
                onPressed: () => Navigator.pop(context)),
          ],
        )).show(context);
  }

  void saveHardware() {
    final typeHardware = context.read<SetValueDropdownCubit>().state;

    Future.delayed(Duration.zero, () {
      final data = HardwareModel(
        devOneID: inputIdOnecontroller.text.toString(),
        devTwoID: inputIdTwocontroller.text.toString(),
        type: typeHardware,
      );

      context.read<HardwareBloc>().add(SaveHardwareEvent(data));
      inputIdOnecontroller.text = '';
      inputIdTwocontroller.text = '';
      Navigator.pop(context);
    });
  }

  // void inputIDHardware() {
  //   final state = context.read<SetValueDropdownCubit>().state;

  //   DialogBackground(
  //     blur: 2,
  //     dialog: AlertDialog(
  //       title: Center(
  //         child: Text(
  //           "Masukan ID",
  //           style: GoogleFonts.poppins(),
  //         ),
  //       ),
  //       titleTextStyle: GoogleFonts.poppins(
  //         fontSize: 18,
  //         color: AppColors.secondary,
  //         fontWeight: FontWeight.bold,
  //         letterSpacing: 1.2,
  //       ),
  //       titlePadding: const EdgeInsets.only(top: 20, bottom: 10),
  //       content: SizedBox(
  //         width: double.maxFinite,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             CustomInputId(controller: inputIdOnecontroller),
  //             if (state == "Penyaring") const SizedBox(height: 10),
  //             if (state == "Penyaring")
  //               CustomInputId(controller: inputIdTwocontroller),
  //           ],
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           child: const Text("Simpan"),
  //           onPressed: () {
  //             Future.delayed(Duration.zero, () {
  //               final data = HardwareModel(
  //                 devOneID: inputIdOnecontroller.text.toString(),
  //                 devTwoID: inputIdTwocontroller.text.toString(),
  //                 type: state,
  //               );

  //               context.read<HardwareBloc>().add(SaveHardwareEvent(data));
  //               Navigator.pop(context);
  //             });
  //           },
  //         ),
  //         TextButton(
  //           child: const Text("Kembali"),
  //           onPressed: () {
  //             Navigator.pop(context);
  //             chooseHadware();
  //           },
  //         ),
  //       ],
  //     ),
  //   ).show(context);
  // }
}
