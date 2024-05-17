import 'package:flutter/material.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';

class OriaRoundedButton extends StatelessWidget {
  const OriaRoundedButton({
    super.key,
    required this.onPress,
    this.child,
    this.text,
    this.primaryColor = OriaColors.green,
    this.textColor,
    this.borderColor,
    this.isLoading = false,
    this.fontSize = 16,
    this.width,
    this.height,
    this.disabled = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
  }) : assert(
            // Provide only child or only text
            (child != null && text == null) || (child == null && text != null));

  final VoidCallback onPress;
  final Widget? child;
  final String? text;
  final Color? primaryColor;
  final Color? textColor;
  final Color? borderColor;
  final bool isLoading;
  final double fontSize;
  final double? width;
  final double? height;
  final bool disabled;
  final EdgeInsets padding;

  Widget loadingWidget() {
    return SizedBox(
      width: 22.5,
      height: 22.5,
      child: CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          textColor ?? Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 55,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: 1,
              )
            : null,
        color: disabled ? null : primaryColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            surfaceTintColor: Colors.transparent,
            backgroundColor: primaryColor,
            foregroundColor: textColor ?? Colors.white,
            disabledBackgroundColor: OriaColors.disabledColor,
            padding: EdgeInsets.zero,
          ),
          onPressed: disabled
              ? null
              : isLoading
                  ? () {}
                  : onPress,
          child: isLoading
              ? loadingWidget()
              : text != null
                  ? Text(
                      text!,
                      textAlign: TextAlign.center,
                    )
                  : child,
        ),
      ),
    );
  }
}
