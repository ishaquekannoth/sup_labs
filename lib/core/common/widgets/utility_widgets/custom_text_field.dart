// form_field_with_validation.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sup_labs_task/core/common/extensions/enums.dart';
import 'package:sup_labs_task/core/common/extensions/extensions.dart';
import 'package:sup_labs_task/core/themes/colors.dart';
import 'package:sup_labs_task/core/themes/stylings.dart';

class FormFieldWithValidation extends StatelessWidget {
  final Pattern? filteringTextInputFormatter;
  final ValueNotifier<bool> isPasswordShown = ValueNotifier(false);
  final double? borderRadius;
  final FieldType type;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final IconData? icon;
  final IconData? postFixIcon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry margin;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? labelStyle;
  final bool? addCountryCode;
  final int? defaultCharLength;
  final void Function(String value)? onChanged;
  final dynamic initialValue;
  final EdgeInsetsGeometry? contentPadding;
  final GlobalKey<FormState>? formKey;
  final bool? isDense;
  final bool? enable;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? obscuringCharacter;
  final double? cursorHeight;
  final int? maxLines;

  FormFieldWithValidation({
    this.formKey,
    this.obscuringCharacter,
    this.filteringTextInputFormatter,
    this.initialValue,
    this.labelStyle,
    this.contentPadding,
    this.margin = EdgeInsets.zero,
    this.borderRadius,
    this.hintStyle = const TextStyle(color: Colors.grey),
    this.autovalidateMode = AutovalidateMode.disabled,
    this.postFixIcon,
    this.isDense = false,
    this.enable = true,
    this.padding,
    this.controller,
    required this.type,
    this.hintText = "",
    super.key,
    this.icon = Icons.email,
    this.defaultCharLength,
    this.cursorHeight,
    this.labelText,
    this.onChanged,
    this.addCountryCode = true,
    this.floatingLabelBehavior,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ValueListenableBuilder(
        valueListenable: isPasswordShown,
        builder: (context, value, child) => Container(
          margin: margin,
          child: TextFormField(
            maxLines: type == FieldType.password ? 1 : maxLines,
            onChanged: onChanged,
            enabled: enable,
            style: TextStylings.defaultTs,
            cursorHeight: cursorHeight,
            obscuringCharacter: obscuringCharacter ?? '•',
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            controller: controller,
            inputFormatters: [
              _getLengthLimitingFormatter(),
              filteringTextInputFormatter == null
                  ? _getDefaultFormatter()
                  : FilteringTextInputFormatter.allow(
                      filteringTextInputFormatter!,
                    ),
            ],
            keyboardType: _getKeyboardType(),
            obscureText: type == FieldType.password && !isPasswordShown.value,
            decoration: InputDecoration(
              floatingLabelBehavior: floatingLabelBehavior,
              errorMaxLines: 1,
              labelText: labelText ?? type.name.capitalizeFirst,
              hintText: hintText ?? type.name.capitalizeFirst,
              prefixIcon: _getPrefixIcon(),
              hintStyle: hintStyle,
              alignLabelWithHint: true,
              contentPadding: EdgeInsets.all(16.w),
              fillColor: AppColors.primaryColor,
              suffixIcon: _getSuffixIcon(),
              labelStyle: labelStyle ?? TextStylings.defaultTs,
              errorStyle: TextStyle(
                height: 0.h,
              ),
              border: _getBorder(),
              focusedBorder: _getFocusedBorder(),
              enabledBorder: _getEnabledBorder(),
              focusedErrorBorder: _getFocusedErrorBorder(),
              errorBorder: _getErrorBorder(),
            ),
            validator: (value) => _validateInput(value),
          ),
        ),
      ),
    );
  }

  TextInputType _getKeyboardType() {
    switch (type) {
      case FieldType.eMail:
        return TextInputType.emailAddress;
      case FieldType.password:
        return TextInputType.visiblePassword;
      case FieldType.phoneNumber:
        return TextInputType.phone;
      default:
        return TextInputType.name;
    }
  }

  LengthLimitingTextInputFormatter _getLengthLimitingFormatter() {
    switch (type) {
      case FieldType.eMail:
        return LengthLimitingTextInputFormatter(defaultCharLength ?? 30);
      case FieldType.name:
        return LengthLimitingTextInputFormatter(defaultCharLength ?? 20);
      case FieldType.phoneNumber:
        return LengthLimitingTextInputFormatter(defaultCharLength ?? 10);
      default:
        return LengthLimitingTextInputFormatter(defaultCharLength ?? 20);
    }
  }

  FilteringTextInputFormatter _getDefaultFormatter() {
    switch (type) {
      case FieldType.name:
        return FilteringTextInputFormatter.deny(RegExp(""));
      case FieldType.phoneNumber:
        return FilteringTextInputFormatter.allow(RegExp("[0-9]"));
      default:
        return FilteringTextInputFormatter.deny(RegExp(""));
    }
  }

  Widget? _getPrefixIcon() {
    if (type == FieldType.phoneNumber && addCountryCode!) {
      return Padding(
        padding:
            EdgeInsets.only(left: 15.w, top: 4.h, bottom: 4.h, right: 10.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "+91",
              style: TextStyle(fontSize: 15.sp),
            ),
            SizedBox(width: 5.w),
            Container(
              height: 24.0,
              width: 1.2,
              color: AppColors.glitterGold,
            ),
          ],
        ),
      );
    }
    return null;
  }

  Widget? _getSuffixIcon() {
    if (type == FieldType.password) {
      return ValueListenableBuilder(
        valueListenable: isPasswordShown,
        builder: (context, value, child) => IconButton(
          icon: Icon(
            value ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          ),
          onPressed: () {
            isPasswordShown.value = !isPasswordShown.value;
          },
        ),
      );
    }
    return null;
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) return null;

    switch (type) {
      case FieldType.eMail:
        return value.isValidEmail ? null : "Invalid Email Address";
      case FieldType.password:
        return value.isValidPassword(defaultCharLength ?? 8)
            ? null
            : "Password should be at least ${defaultCharLength ?? 8} characters long";
      case FieldType.name:
        return value.isValidName(2)
            ? null
            : "Name must be at least 2 characters";
      case FieldType.phoneNumber:
        return value.isValidPhoneNumber ? null : "Invalid Phone Number";
      default:
        return null;
    }
  }

  OutlineInputBorder _getBorder() => const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: AppColors.glitterGold,
        ),
      );

  OutlineInputBorder _getFocusedBorder() => const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.0,
          color: AppColors.primaryColor,
        ),
      );

  OutlineInputBorder _getEnabledBorder() => const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: AppColors.glitterGold,
        ),
      );
  OutlineInputBorder _getErrorBorder() => OutlineInputBorder(
        borderSide: const BorderSide(
          width: 0.5,
          color: AppColors.crimsonRed,
        ),
        borderRadius: BorderRadius.circular(8.0),
      );
  OutlineInputBorder _getFocusedErrorBorder() => OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1.0,
          color: AppColors.crimsonRed,
        ),
        borderRadius: BorderRadius.circular(8.0),
      );
}
