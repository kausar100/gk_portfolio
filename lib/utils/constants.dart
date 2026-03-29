import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppConstants {
  // Colors - Professional Slate & Indigo
  static const Color kPrimaryColor = Color(0xFF6366F1); // Modern Indigo
  static const Color kSecondaryColor = Color(0xFF22D3EE); // Bright Cyan
  static const Color kBackgroundColor = Color(0xFF0F172A); // Deep Slate
  static const Color kCardColor = Color(0xFF1E293B); // Lighter Slate for cards
  static const Color kTextColor = Color(0xFFF8FAFC); // Off-white
  static const Color kTextSecondaryColor = Color(0xFF94A3B8); // Muted Slate

  // Breakpoints
  static const double kMobileBreakpoint = 600;
  static const double kDesktopBreakpoint = 1024;

  // Text Styles
  static TextStyle kHeaderStyle = GoogleFonts.outfit(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: kTextColor,
  );

  static TextStyle kSubHeaderStyle = GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: kTextSecondaryColor,
  );
}
