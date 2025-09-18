import 'package:flutter/material.dart';

class SettingTheme {
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final Color? backgroundColor;
  final Color? dropdownBackgroundColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? spacing;
  final Color? iconColor;
  final double? iconSize;
  final Color? borderColor;
  final double? borderWidth;

  // Default styles - এই গুলো সব সময় available থাকবে
  static const TextStyle defaultLabelStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color(0xFF4C4A46),
  );

  static const TextStyle defaultValueStyle = TextStyle(
    color: Color(0xff655248), 
    fontSize: 14
  );

  const SettingTheme({
    this.labelStyle, // এখন null হতে পারবে, default style use হবে
    this.valueStyle, // এখন null হতে পারবে, default style use হবে
    this.backgroundColor = const Color(0xFFFDFBF5),
    this.dropdownBackgroundColor = const Color(0xFFF5F1E9),
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.margin = const EdgeInsets.only(bottom: 16.0),
    this.spacing = 8.0,
    this.iconColor = const Color(0xFF8C8A86),
    this.iconSize = 24.0,
    this.borderColor,
    this.borderWidth = 0,
  });

  // Dynamic style getters - যদি custom style না দেওয়া হয় তাহলে default use হবে
  TextStyle get effectiveLabelStyle => labelStyle ?? defaultLabelStyle;
  TextStyle get effectiveValueStyle => valueStyle ?? defaultValueStyle;

  SettingTheme copyWith({
    TextStyle? labelStyle,
    TextStyle? valueStyle,
    Color? backgroundColor,
    Color? dropdownBackgroundColor,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? spacing,
    Color? iconColor,
    double? iconSize,
    Color? borderColor,
    double? borderWidth,
  }) {
    return SettingTheme(
      labelStyle: labelStyle ?? this.labelStyle,
      valueStyle: valueStyle ?? this.valueStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      dropdownBackgroundColor: dropdownBackgroundColor ?? this.dropdownBackgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      spacing: spacing ?? this.spacing,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
    );
  }
}