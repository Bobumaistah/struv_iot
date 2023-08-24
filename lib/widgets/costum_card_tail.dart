import 'package:flutter/material.dart';

import '../common/util.dart';

class CostumCardTail extends StatelessWidget {
  const CostumCardTail({
    super.key,
    required this.imagePath,
    required this.title,
    required this.widget,
  });

  final String imagePath;
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(imagePath),
          ),
          Spacer(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  title,
                  style: kHeading6,
                ),
              ),
            ],
          ),
          Spacer(),
          widget
        ],
      ),
    );
  }
}
