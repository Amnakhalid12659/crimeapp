import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CTextTheme {
  CTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    // Headline (Large Titles)
    headlineLarge: GoogleFonts.inter(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),

    // Title (Medium Headings)
    titleLarge: GoogleFonts.inter(
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
      letterSpacing: 0.5,
    ),

    // Subtitle
    titleMedium: GoogleFonts.inter(
      fontSize: 15.0,
      fontWeight: FontWeight.w300,
      color: Colors.grey[500],
    ),

    // Body Text
    bodyLarge: GoogleFonts.inter(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.grey[800],
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.grey[300],
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.grey[300],
    ),
  );

  static TextTheme accentTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF773EFA), // Purple accent
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF773EFA),
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF773EFA).withOpacity(0.8),
    ),
  );
}
