import 'package:flutter/material.dart';

class AccordionConfig {
  final String title;
  final String? svgPath;
  final IconData? iconData;
  final Color? iconColor;
  final double? iconSize;
  final Widget? context;
  final bool isSwitch;
  final bool isExpanded;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged; 
  final ValueChanged<bool>? onExpressionChanged;

  AccordionConfig({
    required this.title,
    this.svgPath,
    this.iconData,
    this.iconColor,
    this.context,
    this.iconSize = 16,
    this.isSwitch = true, 
    this.isExpanded = false,
    this.switchValue = false, 
    this.onSwitchChanged, 
    this.onExpressionChanged
  });


  AccordionConfig copyWith({
    String? title,
    String? svgPath,
    IconData? iconData,
    Widget? context,
    double? iconSize,
    Color? iconColor,
    bool? isSwitch,
    bool? isExpanded,
    bool? switchValue,
    ValueChanged<bool>? onSwitchChanged,
    ValueChanged<bool>? onExpressionChanged
  })
    => AccordionConfig(
           title: title ?? this.title,
           svgPath: svgPath ?? this.svgPath,
           iconData: iconData ?? this.iconData,
           iconColor: iconColor ?? this.iconColor,
           context: context ?? this.context,
           isSwitch: isSwitch ?? this.isSwitch,
           iconSize: iconSize ?? this.iconSize,
           isExpanded: isExpanded ?? this.isExpanded,
           switchValue: switchValue ?? this.switchValue,
           onSwitchChanged: onSwitchChanged ?? this.onSwitchChanged,
           onExpressionChanged: onExpressionChanged ?? this.onExpressionChanged);
 
}