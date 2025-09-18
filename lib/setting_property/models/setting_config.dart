import 'package:flutter/material.dart';

// Enum to define the type of setting widget
enum SettingType {
  dropdown,
  slider,
  switchRow,
  iconRow,
  customRow,
}

class SettingConfig {
  final String? label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final String? placeholder;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  
  // Slider properties
  final SettingType type;
  final double? sliderValue;
  final double? sliderMin;
  final double? sliderMax;
  final int? sliderDivisions;
  final ValueChanged<double>? onSliderChanged;
  final String? sliderLabel;
  
  // Row properties (for switch, icon, custom rows)
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final IconData? iconData;
  final Widget? customWidget;
  final VoidCallback? onTap;
  final Color? activeColor;
  final Color? inactiveColor;

  const SettingConfig({
    this.label,
    this.value,
    required this.items,
    this.onChanged,
    this.placeholder,
    this.prefixIcon,
    this.suffixIcon,
    this.type = SettingType.dropdown, // Default type dropdown
    this.sliderValue,
    this.sliderMin = 0.0,
    this.sliderMax = 100.0,
    this.sliderDivisions,
    this.onSliderChanged,
    this.sliderLabel,
    // Row properties
    this.switchValue,
    this.onSwitchChanged,
    this.iconData,
    this.customWidget,
    this.onTap,
    this.activeColor,
    this.inactiveColor,
  });

  SettingConfig copyWith({
    String? label,
    String? value,
    List<String>? items,
    ValueChanged<String?>? onChanged,
    String? placeholder,
    Widget? prefixIcon,
    Widget? suffixIcon,
    SettingType? type,
    double? sliderValue,
    double? sliderMin,
    double? sliderMax,
    int? sliderDivisions,
    ValueChanged<double>? onSliderChanged,
    String? sliderLabel,
    // Row properties
    bool? switchValue,
    ValueChanged<bool>? onSwitchChanged,
    IconData? iconData,
    Widget? customWidget,
    VoidCallback? onTap,
    Color? activeColor,
    Color? inactiveColor,
  }) {
    return SettingConfig(
      label: label ?? this.label,
      value: value ?? this.value,
      items: items ?? this.items,
      onChanged: onChanged ?? this.onChanged,
      placeholder: placeholder ?? this.placeholder,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      type: type ?? this.type,
      sliderValue: sliderValue ?? this.sliderValue,
      sliderMin: sliderMin ?? this.sliderMin,
      sliderMax: sliderMax ?? this.sliderMax,
      sliderDivisions: sliderDivisions ?? this.sliderDivisions,
      onSliderChanged: onSliderChanged ?? this.onSliderChanged,
      sliderLabel: sliderLabel ?? this.sliderLabel,
      switchValue: switchValue ?? this.switchValue,
      onSwitchChanged: onSwitchChanged ?? this.onSwitchChanged,
      iconData: iconData ?? this.iconData,
      customWidget: customWidget ?? this.customWidget,
      onTap: onTap ?? this.onTap,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
    );
  }
}