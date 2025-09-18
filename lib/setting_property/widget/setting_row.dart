import 'package:flutter/material.dart';
import 'package:library_component/accordion/widget/custom_switch.dart';
import 'package:library_component/setting_property/models/setting_config.dart';
import 'package:library_component/setting_property/models/setting_theme.dart';

class SettingRow extends StatelessWidget {
  final SettingConfig config;
  final SettingTheme? theme;

  const SettingRow({
    super.key,
    required this.config,
    this.theme,
  });

  // Factory constructor for switch row
  factory SettingRow.switchRow({
    Key? key,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    Color? activeColor,
    Color? inactiveColor,
    SettingTheme? theme,
  }) {
    return SettingRow(
      key: key,
      config: SettingConfig(
        label: title,
        items: [], // Empty for row types
        type: SettingType.switchRow,
        switchValue: value,
        onSwitchChanged: onChanged,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
      ),
      theme: theme,
    );
  }

  // Factory constructor for icon row
  factory SettingRow.iconRow({
    Key? key,
    required String title,
    required IconData icon,
    Color? iconColor,
    double? iconSize,
    VoidCallback? onTap,
    SettingTheme? theme,
  }) {
    return SettingRow(
      key: key,
      config: SettingConfig(
        label: title,
        items: [], // Empty for row types
        type: SettingType.iconRow,
        iconData: icon,
        onTap: onTap,
      ),
      theme: theme?.copyWith(
        iconColor: iconColor,
        iconSize: iconSize,
      ),
    );
  }

  // Factory constructor for custom widget row
  factory SettingRow.customRow({
    Key? key,
    required String title,
    required Widget customWidget,
    VoidCallback? onTap,
    SettingTheme? theme,
  }) {
    return SettingRow(
      key: key,
      config: SettingConfig(
        label: title,
        items: [], // Empty for row types
        type: SettingType.customRow,
        customWidget: customWidget,
        onTap: onTap,
      ),
      theme: theme,
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveTheme = theme ?? const SettingTheme();

    return Container(
      margin: effectiveTheme.margin,
      child: _buildRowContent(effectiveTheme),
    );
  }

  Widget _buildRowContent(SettingTheme effectiveTheme) {
    Widget rowContent = Padding(
      padding: effectiveTheme.padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              config.label ?? '',
              style: effectiveTheme.effectiveLabelStyle,
            ),
          ),
          _buildTrailingWidget(effectiveTheme),
        ],
      ),
    );

    if (config.onTap != null) {
      return GestureDetector(
        onTap: config.onTap,
        child: rowContent,
      );
    }

    return rowContent;
  }

  Widget _buildTrailingWidget(SettingTheme effectiveTheme) {
    switch (config.type) {
      case SettingType.switchRow:
        return CustomSwitch(
          value: config.switchValue ?? false,
          onChanged: config.onSwitchChanged,
          activeColor: config.activeColor ?? effectiveTheme.iconColor ?? const Color(0xff895737),
          inactiveColor: config.inactiveColor ?? const Color(0xffF2EAE0),
        );
        
      case SettingType.iconRow:
        return Icon(
          config.iconData ?? Icons.arrow_forward_ios,
          color: effectiveTheme.iconColor ?? const Color(0xff895737),
          size: effectiveTheme.iconSize ?? 20,
        );
        
      case SettingType.customRow:
        return config.customWidget ?? SizedBox.shrink();
        
      default:
        return SizedBox.shrink();
    }
  }
}