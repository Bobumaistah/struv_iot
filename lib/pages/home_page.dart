import 'package:flutter/material.dart';
import 'package:struviot_apps/common/util.dart';

import '../widgets/costum_card_tail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("StruvIoT", style: kHeading2),
              Row(
                children: [
                  Text("Hardware Monitoring", style: kHeading6),
                  Spacer(),
                  Text("Connected to 'SSID'", style: kBodyText)
                ],
              ),
              SizedBox(height: 50),
              CostumCardTail(
                imagePath: 'assets/reaktor.png',
                title: "Reaktor",
                widget: Image.asset("assets/btn_reak.png"),
              ),
              SizedBox(height: 24),
              CostumCardTail(
                imagePath: 'assets/reaktor.png',
                title: "Penyaring",
                widget: Image.asset("assets/weight.png"),
              ),
              SizedBox(height: 24),
              CostumCardTail(
                imagePath: 'assets/reaktor.png',
                title: "Pengering",
                widget: Image.asset("assets/weight.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
