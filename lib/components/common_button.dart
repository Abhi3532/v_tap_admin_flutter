import 'package:flutter/material.dart';
import 'package:v_tap_admin_flutter/core/theme/app_colors.dart';

class CommonButton extends StatelessWidget {
  final Color? fillColor;
  final Color? borderColor;
  final String text;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final TextStyle? textStyle;
  final double? width;
  final Widget? icon;
  const CommonButton({
    Key? key,
    this.fillColor,
    this.borderColor,
    required this.text,
    this.onTap,
    this.padding,
    this.borderRadius,
    this.textStyle,
    this.width,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      onTap: onTap,
      child: Container(
        width: width,
        padding: padding,
        decoration: BoxDecoration(
            color: fillColor ?? ColorConstants.yellow1,
            border: borderColor != null ? Border.all(color: borderColor!, width: 1) : null,
            borderRadius: BorderRadius.circular(borderRadius ?? 0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(
                width: 12,
              )
            ],
            Center(
              child: Text(
                text,
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}