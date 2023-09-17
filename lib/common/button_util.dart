import 'package:flutter/material.dart';

class ButtonUtil {
  static filled({
    Color? fgColor,
    Color? bgColor,
    String? text,
    VoidCallback? cta,
    bool? hasIcon,
    BorderRadiusGeometry? borderRadius,
  }) {
    return InkWell(
      onTap: cta,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        child: Container(
          padding: const EdgeInsets.all(18),
          // height: 60,
          width: double.infinity,
          color: bgColor ?? Colors.grey,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: hasIcon ?? false,
                child: const CircleAvatar(),
              ),
              hasIcon == false
                  ? const SizedBox(width: 12)
                  : const SizedBox.shrink(),
              Text(
                text ?? 'Button',
                style: TextStyle(color: fgColor ?? Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static outlined({
    Color? fgColor,
    Color? bgColor,
    String? text,
    bool? hasIcon,
    Widget? child,
    VoidCallback? cta,
  }) {
    return InkWell(
      onTap: cta,
      child: Container(
        // alignment: Alignment.center,
        // height: 60,
        padding: const EdgeInsets.all(18),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: bgColor ?? Colors.grey[800]!),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: hasIcon ?? false,
              child: child ?? const SizedBox.shrink(),
            ),
            hasIcon == true
                ? const SizedBox(width: 12)
                : const SizedBox.shrink(),
            Text(
              text ?? 'Button',
              style: TextStyle(color: fgColor ?? Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
