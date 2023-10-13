import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';

class CustomInputId extends StatelessWidget {
  const CustomInputId({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(
          "Topic",
          style: GoogleFonts.poppins(
            height: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 15, top: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.2,
            color: AppColors.secondary,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.2,
            color: AppColors.contentColorGreen,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        floatingLabelStyle: GoogleFonts.poppins(
          height: 1.05,
          color: AppColors.contentColorGreen,
        ),
      ),
    );
  }
}
