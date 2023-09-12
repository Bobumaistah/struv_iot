import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:struviot_apps/utils/app_colors.dart';

const textColor = AppColors.secondary;

final TextTheme myTextTheme = TextTheme(
  //H1
  displayLarge: GoogleFonts.poppins(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.5,
  ),

  //H2
  displayMedium: GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
    color: textColor,
  ),

  //H3
  displaySmall: GoogleFonts.poppins(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: textColor,
  ),

  //H4
  headlineMedium: GoogleFonts.poppins(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
    color: textColor.withOpacity(0.8),
  ),

  //H5
  headlineSmall: GoogleFonts.poppins(
    fontSize: 23,
    fontWeight: FontWeight.w700,
    color: textColor,
  ),

  //H6
  titleLarge: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  ),

  //sub 1
  titleMedium: GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: textColor,
  ),

  //sub 2
  titleSmall: GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),

  // bodyText 1
  bodyLarge: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: textColor.withOpacity(0.9),
  ),

  // bodyText 2
  bodyMedium: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
    color: textColor,
  ),

  // Button text
  labelLarge: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),

  // Caption text
  bodySmall: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),

  // overline
  labelSmall: GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: textColor,
  ),
);
