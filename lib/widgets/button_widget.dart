// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg2_24/widgets/spinner_widget.dart';
import 'package:pas1_mobile_11pplg2_24/utils/theme.dart';

enum ButtonVariant { primary, secondary, warning, danger, outline }

class ButtonWidget extends StatelessWidget {
  final String text;
  final ButtonVariant variant;
  final VoidCallback? onPressed;
  bool? loading;

  Color? backgroundColor;
  Color? foregroundColor;
  Widget? prefixIcon;
  double? borderWidth;
  Color? borderColor;
  double? borderRadius;
  FontWeight? fontWeight;
  EdgeInsetsGeometry? padding;
  double? width;

  ButtonWidget(this.text,
      {required this.variant,
      required this.onPressed,
      this.loading,
      this.backgroundColor,
      this.foregroundColor,
      this.borderWidth,
      this.borderColor,
      this.borderRadius,
      this.fontWeight,
      this.padding,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    final data = variantCheck();
    if (backgroundColor != null) data.backgroundColor = backgroundColor;
    if (foregroundColor != null) data.foregroundColor = foregroundColor;
    if (borderWidth != null) data.borderWidth = borderWidth;
    if (borderColor != null) data.borderColor = borderColor;
    if (borderRadius != null) data.borderRadius = borderRadius;
    if (fontWeight != null) data.fontWeight = fontWeight;

    return CustomButtonWidget(text,
        onPressed: onPressed,
        backgroundColor: data.backgroundColor,
        foregroundColor: data.foregroundColor,
        borderWidth: data.borderWidth,
        borderColor: data.borderColor,
        borderRadius: data.borderRadius,
        fontWeight: data.fontWeight,
        padding: padding,
        width: width,
        loading: loading);
  }

  variantCheck() {
    switch (variant) {
      case ButtonVariant.secondary:
        return CustomButtonWidget(text,
            onPressed: onPressed,
            backgroundColor: AppTheme.secondaryColor,
            foregroundColor: AppTheme.textButtonColor,
            borderRadius: 100.0,
            fontWeight: FontWeight.w600);

      case ButtonVariant.warning:
        return CustomButtonWidget(text,
            onPressed: onPressed,
            backgroundColor: AppTheme.warningColor,
            foregroundColor: AppTheme.textButtonColor,
            borderRadius: 100.0,
            fontWeight: FontWeight.w600);

      case ButtonVariant.danger:
        return CustomButtonWidget(text,
            onPressed: onPressed,
            backgroundColor: AppTheme.errorColor,
            foregroundColor: AppTheme.textButtonColor,
            borderRadius: 100.0,
            fontWeight: FontWeight.w600);

      case ButtonVariant.outline:
        return CustomButtonWidget(text,
            onPressed: onPressed,
            backgroundColor: AppTheme.white100,
            foregroundColor: AppTheme.primaryColorLight,
            borderWidth: 4.0,
            borderColor: AppTheme.primaryColorLight,
            borderRadius: 100.0,
            fontWeight: FontWeight.w500);

      default:
        return CustomButtonWidget(text,
            onPressed: onPressed,
            backgroundColor: AppTheme.primaryColor,
            foregroundColor: AppTheme.textButtonColor,
            borderRadius: 100.0,
            fontWeight: FontWeight.w600);
    }
  }
}

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  bool? loading = false;

  Color? backgroundColor = AppTheme.primaryColor;
  Color? foregroundColor = AppTheme.textButtonColor;
  double? borderWidth;
  Color? borderColor;
  double? borderRadius = 100.0; // fully rounded
  FontWeight? fontWeight = FontWeight.w500;
  EdgeInsetsGeometry? padding;
  double? width;

  CustomButtonWidget(this.text,
      {required this.onPressed,
      this.loading,
      this.backgroundColor,
      this.foregroundColor,
      this.borderWidth,
      this.borderColor,
      this.borderRadius,
      this.fontWeight,
      this.padding,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading == true ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppTheme.primaryColor,
        foregroundColor: foregroundColor ?? AppTheme.textButtonColor,
        side: BorderSide(
            color: borderColor ?? backgroundColor!, width: borderWidth ?? 0.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 100.0)),
        minimumSize: Size(width ?? double.infinity, 0),
        padding: padding ?? const EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: loading == true
          ? const SpinnerWidget(size: SpinnerSize.small)
          : Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: fontWeight ?? FontWeight.w500, color: foregroundColor ?? AppTheme.textButtonColor),
            ),
    );
  }
}
