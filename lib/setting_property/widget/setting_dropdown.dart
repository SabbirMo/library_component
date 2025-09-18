
import 'package:library_component/setting_property/models/setting_config.dart';
import 'package:library_component/setting_property/setting_property.dart';
import 'package:library_component/setting_property/widget/setting_row.dart';

class SettingDropdown extends StatelessWidget {
  final SettingConfig config;
  final SettingTheme? theme;

  const SettingDropdown({
    super.key,
    required this.config,
    this.theme,
  });

  // Simple factory constructor এ title required রাখা হবে না
  factory SettingDropdown.simple({
    Key? key,
    String? label,
    String? value,
    required List<String> items,
    ValueChanged<String?>? onChanged,
    String? placeholder,
    Widget? prefixIcon,
    Widget? suffixIcon,
    SettingTheme? theme,
  }) {
    return SettingDropdown(
      key: key,
      config: SettingConfig(
        label: label,
        value: value,
        items: items,
        onChanged: onChanged,
        placeholder: placeholder,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        type: SettingType.dropdown,
      ),
      theme: theme,
    );
  }
  
  // Slider factory constructor
  factory SettingDropdown.slider({
    Key? key,
    String? label,
    required double value,
    double min = 0.0,
    double max = 100.0,
    int? divisions,
    ValueChanged<double>? onChanged,
    String? sliderLabel,
    Widget? prefixIcon,
    SettingTheme? theme,
  }) {
    return SettingDropdown(
      key: key,
      config: SettingConfig(
        label: label,
        items: [], // Empty for slider
        type: SettingType.slider,
        sliderValue: value,
        sliderMin: min,
        sliderMax: max,
        sliderDivisions: divisions,
        onSliderChanged: onChanged,
        sliderLabel: sliderLabel,
        prefixIcon: prefixIcon,
      ),
      theme: theme,
    );
  }

  

  @override
  Widget build(BuildContext context) {
    final effectiveTheme = theme ?? const SettingTheme();

    return Container(
      margin: effectiveTheme.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dropdown এর জন্য label দেখাবে, slider নিজেই label handle করে
          if (config.type == SettingType.dropdown && config.label != null) ...[
            Row(
              children: [
                if (config.prefixIcon != null) ...[
                  config.prefixIcon!,
                  SizedBox(width: 8),
                ],
                Text(
                  config.label!,
                  style: effectiveTheme.effectiveLabelStyle, // Dynamic style getter ব্যবহার
                ),
              ],
            ),
            SizedBox(height: effectiveTheme.spacing),
          ],
          
          // Widget based on type
          if (config.type == SettingType.dropdown) 
            _buildDropdownWidget(effectiveTheme)
          else if (config.type == SettingType.slider)
            _buildSliderWidget(effectiveTheme)
          else if (config.type == SettingType.switchRow || 
                   config.type == SettingType.iconRow || 
                   config.type == SettingType.customRow)
            SettingRow(config: config, theme: theme),
        ],
      ),
    );
  }

  Widget _buildDropdownWidget(SettingTheme effectiveTheme) {
    return Container(
      padding: effectiveTheme.padding,
      decoration: BoxDecoration(
        color: effectiveTheme.dropdownBackgroundColor,
        borderRadius: effectiveTheme.borderRadius,
        border: effectiveTheme.borderWidth! > 0 
            ? Border.all(
                color: effectiveTheme.borderColor ?? Colors.grey,
                width: effectiveTheme.borderWidth!,
              )
            : null,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: config.value,
          isExpanded: true,
          hint: config.placeholder != null 
              ? Text(
                  config.placeholder!,
                  style: effectiveTheme.effectiveValueStyle.copyWith(
                    color: effectiveTheme.iconColor,
                  ),
                )
              : null,
          icon: config.suffixIcon ?? Icon(
            Icons.keyboard_arrow_down,
            color: effectiveTheme.iconColor,
            size: effectiveTheme.iconSize,
          ),
          style: effectiveTheme.effectiveValueStyle,
          dropdownColor: effectiveTheme.dropdownBackgroundColor,
          items: config.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: config.onChanged,
        ),
      ),
    );
  }

  Widget _buildSliderWidget(SettingTheme effectiveTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label উপরে থাকবে (শুধু slider এর জন্য)
        if (config.label != null) ...[
          Text(
            config.label!,
            style: effectiveTheme.effectiveLabelStyle,
          ),
          SizedBox(height: 8),
        ],
        
        // নিচে slider এবং ডান পাশে font count
        Row(
          children: [
            Expanded(
              child: Slider(
                value: config.sliderValue ?? 0.0,
                min: config.sliderMin ?? 0.0,
                max: config.sliderMax ?? 100.0,
                divisions: null, // চোট চোট পয়েন্ট সরিয়ে দিলাম
                activeColor: effectiveTheme.iconColor,
                inactiveColor: effectiveTheme.iconColor?.withValues(alpha:  0.3),
                onChanged: config.onSliderChanged,
              ),
            ),
            SizedBox(width: 12),
            Text(
              '${config.sliderValue?.toInt() ?? 0}',
              style: effectiveTheme.effectiveValueStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: effectiveTheme.iconColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}