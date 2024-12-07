import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sup_labs_task/core/common/extensions/generic_declarations.dart';
import 'package:sup_labs_task/core/themes/colors.dart';

class SingleHeadingText extends StatelessWidget {
  final String heading;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextStyle? viewAllButtonStyle;
  final Alignment? alignment;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final bool? showViewAllButton;
  final WidgetDataExporter<String> onViewAllTap;
  const SingleHeadingText(
      {super.key,
      required this.heading,
      this.style,
      this.textAlign,
      this.alignment = Alignment.topLeft,
      this.margin,
      this.height,
      this.showViewAllButton = false,
      this.onViewAllTap,
      this.viewAllButtonStyle,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment,
        width: width ?? ScreenUtil().screenWidth,
        height: height ?? 36.h,
        margin: margin ?? EdgeInsets.only(left: 16.w, right: 16.w),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                heading,
                overflow: TextOverflow.ellipsis,
                style: style ??
                    TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor),
                textAlign: textAlign ?? TextAlign.left,
                maxLines: 1,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            if (showViewAllButton!)
              InkWell(
                onTap:
                    onViewAllTap != null ? () => onViewAllTap!(heading) : null,
                child: Text(
                  "View all",
                  style: viewAllButtonStyle ??
                      TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          color: AppColors.black),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                ),
              )
          ],
        ));
  }
}
