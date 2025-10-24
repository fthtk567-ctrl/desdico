import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 64,
    fontWeight: FontWeight.w700,
    color: AppColors.offWhite,
    height: 1.2,
  );

  static TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    color: AppColors.offWhite,
    height: 1.3,
  );

  static TextStyle heading3 = GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: AppColors.offWhite,
    height: 1.4,
  );

  static TextStyle heading4 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.offWhite,
    height: 1.4,
  );

  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.offWhite,
    height: 1.6,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.offWhite,
    height: 1.6,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.offWhite.withOpacity(0.8),
    height: 1.6,
  );

  static TextStyle button = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.deepBlack,
    letterSpacing: 0.5,
  );

  static TextStyle goldAccent = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.goldAccent,
    letterSpacing: 0.5,
  );
}
