
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sup_labs_task/core/themes/stylings.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      this.height,
      this.width,
      this.margin,
      required this.text,
      this.textStyle,
      this.textAlign,
      this.alignment,
      this.maxLines});
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final String text;
  final TextAlign? textAlign;
  final AlignmentGeometry? alignment;
  final TextStyle? textStyle;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ?? Alignment.center,
      height: height,
      width: width ?? ScreenUtil().screenWidth,
      margin: margin,
      child: Text(
        text,
        maxLines: maxLines ?? 1,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign ?? TextAlign.center,
        style: textStyle ?? TextStylings.defaultTsWhite,
      ),
    );
  }
}
