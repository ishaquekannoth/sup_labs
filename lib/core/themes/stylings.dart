
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sup_labs_task/core/themes/colors.dart';
import 'package:sup_labs_task/core/themes/themes.dart';

class TextStylings {
  static TextStyle defaultTs = TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
      fontSize: 15.h);
  static TextStyle celebrationtStyle = TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: AppTheme.royalFont,
      overflow: TextOverflow.ellipsis,
      fontSize: 24.h);
  static TextStyle infromativeStyle = TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      fontFamily: AppTheme.secondaryFont,
      overflow: TextOverflow.ellipsis,
      fontSize: 24.h);
  static TextStyle defaultTsWhite = TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      fontFamily: AppTheme.primaryFont,
      overflow: TextOverflow.ellipsis,
      fontSize: 24.h);
  static TextStyle defaultTsYellow = TextStyle(
      color: AppColors.canaryYellow,
      fontWeight: FontWeight.w400,
      fontFamily: AppTheme.primaryFont,
      overflow: TextOverflow.ellipsis,
      fontSize: 24.h);
}
