import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_component/accordion/models/accordion_config.dart';
import 'package:library_component/accordion/models/accordion_theme.dart';

class AccordionWidget extends StatefulWidget {
  const AccordionWidget({super.key, required this.config,  this.theme});

  final AccordionConfig config;
  final AccordionTheme? theme;

  
  factory AccordionWidget.simple({
    Key? key, 
    required String title,
     Widget? context,
    double? iconSize,
    Color? iconColor,
    IconData? iconData, 
    String? svgPath, 
    bool isExpanded = false, 
    ValueChanged<bool>? onExpressionChanged,
    AccordionTheme? theme,
  })
  {
    return AccordionWidget(
      key: key,
      config: AccordionConfig(
        title: title, 
        context: context, 
        iconData: iconData, 
        svgPath: svgPath, 
        iconSize: iconSize,
        iconColor: iconColor,
        isExpanded: isExpanded, 
        onExpressionChanged: onExpressionChanged,
        ),
        theme: theme,
      );
  }

  @override
  State<AccordionWidget> createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    animation = controller.drive(Tween<double>(begin: 0.0, end: 0.5));

    if(widget.config.isExpanded){
      controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void handleTap() {
   setState(() {
      if (controller.isDismissed) {
      controller.forward();
    } else {
      controller.reverse();
    }
   });
   widget.config.onExpressionChanged?.call(controller.isCompleted);
  }

  Widget buildLoadingIcon(double iconSize, Color iconColor){
    final effectiveIconSize = widget.config.iconSize ?? iconSize;
    if(widget.config.svgPath != null && widget.config.svgPath!.isNotEmpty){
      return SvgPicture.asset(
        widget.config.svgPath!,
        colorFilter: ColorFilter.mode(widget.theme?.iconColor ?? Colors.brown, BlendMode.dst),
        width: effectiveIconSize,
        height: effectiveIconSize
      );
    }
    else if(widget.config.iconData != null){
      return Icon(
        widget.config.iconData,
        color: widget.theme?.iconColor ?? Colors.brown,
        size: effectiveIconSize,
      );
    }
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final _effectiveTheme = widget.theme ?? AccordionTheme();
   // final ThemeData _materialTheme = Theme.of(context);

    final titleStyle = _effectiveTheme.textStyle?.copyWith(
      color: _effectiveTheme.titleColor ?? Color(0xff895737),
      fontWeight: FontWeight.w600,
      fontSize: 16,
      );
    


    return Column(
      mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          color: _effectiveTheme.backgroundColor ?? Colors.transparent, 
          borderRadius: _effectiveTheme.borderRadius, 
          child: widget.config.isSwitch ? InkWell(
            onTap: handleTap,
            borderRadius: _effectiveTheme.borderRadius,
            highlightColor: Colors.transparent, 
            splashColor: _effectiveTheme.enableRipple ? _effectiveTheme.splashColor : Colors.transparent,
            child: Container(
              padding: _effectiveTheme.padding, 
              height: _effectiveTheme.containerHeight, 
              child: Row(
                children: [
                  if(widget.config.iconData != null || (widget.config.svgPath != null && widget.config.svgPath !.isNotEmpty)) ... [
                    buildLoadingIcon(_effectiveTheme.iconSize, _effectiveTheme.iconColor ?? Colors.brown),
                    
                    SizedBox(width: widget.theme?.iconTextGap ?? 12),
                    Expanded(child: Text(widget.config.title, style: titleStyle, maxLines: 1, overflow: TextOverflow.ellipsis,),),
          
                    RotationTransition(turns: animation, child: Icon(Icons.expand_more, size: _effectiveTheme.iconSize, color: _effectiveTheme.iconColor ?? Colors.brown,),)
                  ]
                ],
              ),
            ),
          ) : _buildContent(_effectiveTheme, titleStyle),
        ),
       if (widget.config.isSwitch)
          SizeTransition(sizeFactor: controller, child: widget.config.context,),
        if (!widget.config.isSwitch && widget.config.context != null)
          widget.config.context!,
        Divider(
          color: Color(0xffDBC9BB), 
          height: 5.0,
          thickness: 1,
        ),
      ],  
    );
  }

   Widget _buildContent(AccordionTheme _effectiveTheme, TextStyle? titleStyle) {
    return Container(
      padding: _effectiveTheme.padding, 
      height: _effectiveTheme.containerHeight, 
      child: Row(
        children: [
          if(widget.config.iconData != null || (widget.config.svgPath != null && widget.config.svgPath !.isNotEmpty)) ... [
            buildLoadingIcon(_effectiveTheme.iconSize, _effectiveTheme.iconColor ?? Colors.brown),
            
            SizedBox(width: widget.theme?.iconTextGap ?? 12),
            Expanded(child: Text(widget.config.title, style: titleStyle, maxLines: 1, overflow: TextOverflow.ellipsis,),),
    
            if (widget.config.isSwitch)
              RotationTransition(
                turns: animation, 
                child: Icon(
                  Icons.expand_more, 
                  size: _effectiveTheme.iconSize, 
                  color: _effectiveTheme.iconColor ?? Colors.brown,
                ),
              ),
          ]
        ],
      ),
    );
  }
}