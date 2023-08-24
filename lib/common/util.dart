import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kBackground = Color(0xffF8F8FB);
const Color kPrimary = Color(0xff274C77);
const Color kSecondary = Color(0xff274C77);
const Color kSoftBlack = Color(0xff191A1D);
const Color kGrey = Color(0xffD9D9D9);
const Color kWhite = Colors.white;

final TextStyle kHeading2 = GoogleFonts.poppins(
  fontSize: 34,
  fontWeight: FontWeight.bold,
);
final TextStyle kHeading3 = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
final TextStyle kHeading4 = GoogleFonts.poppins(
  fontSize: 26,
  fontWeight: FontWeight.w600,
);
final TextStyle kHeading5 = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
final TextStyle kHeading6 = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
);
final TextStyle kSubtitle = GoogleFonts.poppins(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
);
final TextStyle kBodyText = GoogleFonts.poppins(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

final kTextTheme = TextTheme(
  displayMedium: kHeading2,
  displaySmall: kHeading3,
  headlineMedium: kHeading4,
  headlineSmall: kHeading5,
  titleLarge: kHeading6,
  titleMedium: kSubtitle,
  bodyMedium: kBodyText,
);

// Initialize color scheme using a base color as a reference
final kColorScheme = ColorScheme.fromSeed(
  seedColor: kPrimary, // Reference color used to create the color scheme
  primary: kPrimary, // Main color in the color scheme
  primaryContainer: kPrimary, // Background color for primary elements
  secondary: kSecondary, // Secondary color in the color scheme
  secondaryContainer: kSecondary, // Background color for secondary elements
  surface: kSoftBlack, // Surface color in the color scheme
  background: kWhite, // Background color in the color scheme
  error: Colors.red, // Color indicating error conditions
  onPrimary: kSoftBlack, // Text color corresponding to the primary color
  onSecondary: kSecondary, // Text color corresponding to the secondary color
  onSurface: kSecondary, // Text color corresponding to the surface color
  onBackground: kWhite, // Text color corresponding to the background color
  onError: Colors.red, // Text color corresponding to the error color
  brightness: Brightness.light, // Light mode brightness
);
