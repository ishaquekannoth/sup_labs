
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sup_labs_task/core/common/extensions/generic_declarations.dart';
import 'package:sup_labs_task/core/themes/colors.dart';

class GenericButton<T extends Object> extends StatelessWidget {
  final T buttonData;
  final bool? disabled;
  final String? buttonTitle;
  final Color? buttonColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final Size? buttonDimensions;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final WidgetDataExporter<T> onTap;
  const GenericButton(
      {super.key,
      this.onTap,
      this.buttonTitle = "Button",
      this.buttonColor,
      this.textStyle,
      this.buttonDimensions,
      this.borderRadius,
      this.margin,
      required this.buttonData,
      this.disabled = false,
      this.borderColor,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? ScreenUtil().screenWidth,
      margin: margin ?? EdgeInsets.only(top: 16.h),
      height: buttonDimensions == null ? 40.h : buttonDimensions!.height,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onTap != null && disabled == false
            ? () => onTap?.call(buttonData)
            : null,
        child: Container(
          width: buttonDimensions == null ? 118.w : buttonDimensions!.width,
          height: buttonDimensions == null ? 40.h : buttonDimensions!.height,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: disabled! ? AppColors.grey : buttonColor ?? Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1,
                  color: disabled!
                      ? AppColors.grey
                      : borderColor ?? AppColors.primaryColor),
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            ),
          ),
          child: Text(buttonTitle!,
              overflow: TextOverflow.ellipsis, maxLines: 1, style: textStyle),
        ),
      ),
    );
  }
}
