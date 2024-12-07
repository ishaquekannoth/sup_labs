import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDefaults {
  // Private constructor
  AppDefaults._();

  // Singleton instance
  static final AppDefaults instance = AppDefaults._();

  // Constants and properties
  static double radius = 15.r;
  static double marginH = 15.h;
  static double marginW = 15.w;
  static double paddingH = 15.h;
  static double paddingW = 15.w;

  /// Used For Border Radius
  BorderRadius get borderRadius => BorderRadius.circular(radius);

  /// Used For Bottom Sheet
  BorderRadius get bottomSheetRadius => BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      );

  /// Used For Top Sheet
  BorderRadius get topSheetRadius => BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      );

  /// Default Box Shadow used for containers
  List<BoxShadow> get boxShadow => [
        BoxShadow(
          blurRadius: 10,
          spreadRadius: 0,
          offset: const Offset(0, 2),
          color: Colors.black.withOpacity(0.04),
        ),
      ];

  Duration get duration => const Duration(milliseconds: 300);
}
