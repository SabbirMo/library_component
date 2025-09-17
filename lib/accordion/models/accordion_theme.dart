import 'package:flutter/material.dart';

class AccordionTheme {
 final double iconSize;
 final double containerHeight;
 final double? iconTextGap;
 final EdgeInsets? padding;
 final TextStyle? textStyle;
 final Color? titleColor;
 final Color? iconColor;
 final Color? backgroundColor;
final BorderRadius? borderRadius; 
  final bool enableRipple;
  final Color? splashColor;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;




  AccordionTheme({
    this.iconSize = 22,
    this.containerHeight = 55,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.textStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w400,),
    this.titleColor,
    this.backgroundColor,
    this.borderRadius,
    this.enableRipple = true,
    this.iconColor,
    this.iconTextGap,
    this.splashColor,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });


  AccordionTheme copyWith({
    double? iconSize,
    double? containerHeight,
    double? iconTextGap,
    EdgeInsets? padding,
    TextStyle? textStyle,
    Color? titleColor,
    Color? backgroundColor,
    BorderRadius? borderRadius,
    bool? enableRipple,
    Color? splashColor,
    Color? iconColor,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
  }) {
    return AccordionTheme(
      iconSize: iconSize ?? this.iconSize,
      containerHeight: containerHeight ?? this.containerHeight,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
      titleColor: titleColor ?? this.titleColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      iconColor: iconColor ?? this.iconColor,
      iconTextGap: iconTextGap ?? this.iconTextGap,
      splashColor: splashColor ?? this.splashColor,
    );
  }
}