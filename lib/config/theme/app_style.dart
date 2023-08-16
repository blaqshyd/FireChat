import 'package:flutter/material.dart';
import '../../constants/app_exports.dart';

class AppStyle {
  AppStyle._();

  //! Header - h1 - 28, h2 - 20

  static TextStyle h1Dark600 = GoogleFonts.inter(
    color: Pallete.darkColor,
    fontWeight: FontWeight.w600,
    fontSize: 28,
  );

  static TextStyle h2Dark500 = GoogleFonts.inter(
    color: Pallete.darkColor,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );

  //! Medium - 18 and button size

  static TextStyle mLight500 = GoogleFonts.inter(
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static TextStyle mNeutral500 = GoogleFonts.inter(
    color: Pallete.neutral,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static TextStyle mDark = GoogleFonts.inter(
    color: Pallete.darkColor,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

//! body text - 16

  static TextStyle bNeutral400 = GoogleFonts.inter(
    color: Pallete.neutral,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static TextStyle bDark400 = GoogleFonts.inter(
    color: Pallete.darkColor,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static TextStyle bFormLabel = GoogleFonts.inter(
    color: const Color(0xFF2B2B2B),
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  //! small text - 14

  static TextStyle sDark400 = GoogleFonts.inter(
    color: Pallete.darkColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static TextStyle bFormHint = GoogleFonts.inter(
    color: const Color(0xFFBBBBBB),
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  //! x small - 12

  static TextStyle xsDark = GoogleFonts.inter(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
}
