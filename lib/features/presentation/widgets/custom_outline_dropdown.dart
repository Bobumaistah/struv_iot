import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';

class CustomOutlineDropdown extends StatelessWidget {
  const CustomOutlineDropdown({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          alignment: AlignmentDirectional.centerStart,
          value: item,
          child: Text(item),
        );
      }).toList(),
      style: GoogleFonts.poppins(
        color: AppColors.secondary,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      elevation: 0,
      borderRadius: BorderRadius.circular(15),
      dropdownColor: AppColors.contentColorWhite,
      decoration: InputDecoration(
        contentPadding: const EdgeInsetsDirectional.only(start: 15, end: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.secondary,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.secondary,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.secondary,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
