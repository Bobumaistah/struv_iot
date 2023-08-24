import 'package:flutter/material.dart';
import 'package:struviot_apps/common/util.dart';
import 'package:struviot_apps/pages/home_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("StruvIoT", style: kHeading3),
                SizedBox(height: 120),
                Image.asset('assets/get_started_illustration.png'),
                SizedBox(height: 35),
                Text(
                  "Hardware Monitoring",
                  style: kHeading5,
                ),
                SizedBox(height: 5),
                Text(
                  "Aplikasi untuk memonitoring dan mengontrol hardware dari sistem produksi pupuk struvite berbasis IoT",
                  textAlign: TextAlign.center,
                  style: kSubtitle,
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size(double.infinity, 55),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    backgroundColor: kPrimary,
                  ),
                  child: Text(
                    "Start",
                    style: kHeading6.copyWith(color: kWhite),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
