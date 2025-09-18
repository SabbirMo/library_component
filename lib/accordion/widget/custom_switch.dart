import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final double? width;
  final double? height;
  final double? thumbSize;
  final Duration? duration;
  final List<BoxShadow>? thumbShadow;

  const CustomSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor = Colors.white,
    this.width = 46,
    this.height = 28,
    this.thumbSize = 20,
    this.duration = const Duration(milliseconds: 250),
    this.thumbShadow,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveActiveColor = activeColor ?? Color(0xff895737);
    final effectiveInactiveColor = inactiveColor ?? Color(0xffF2EAE0);
    final effectiveThumbShadow = thumbShadow ?? [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.2),
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ];

    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!value);
        }
      },
      child: AnimatedContainer(
        duration: duration!,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height! / 2),
          color: value ? effectiveActiveColor : effectiveInactiveColor,
        ),
        child: AnimatedAlign(
          duration: duration!,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: thumbSize,
            height: thumbSize,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: thumbColor,
              borderRadius: BorderRadius.circular(thumbSize! / 2),
              boxShadow: effectiveThumbShadow,
            ),
          ),
        ),
      ),
    );
  }
}

// Factory constructors for different sizes and styles
extension CustomSwitchStyles on CustomSwitch {
  // Small size switch
  static CustomSwitch small({
    Key? key,
    required bool value,
    ValueChanged<bool>? onChanged,
    Color? activeColor,
    Color? inactiveColor,
  }) {
    return CustomSwitch(
      key: key,
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      width: 36,
      height: 22,
      thumbSize: 16,
    );
  }


  
}