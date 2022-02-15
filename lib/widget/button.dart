import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';

class AppButton extends StatelessWidget {
  Function()? onPressed;
  String title;
  Color disabledColor;
  Color titleColor;
  Color enabledColor;
  bool enabled;
  Widget? icon;
  bool? showIcon;

  AppButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.disabledColor,
      required this.titleColor,
      required this.enabledColor,
      required this.enabled,
      this.icon,
      this.showIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: enabled ? enabledColor : disabledColor,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFontsStyle.getAppTextViewBold(title,

                    size: AppFontsStyle.textFontSize20,
                    color: titleColor),
              ],
            ),
          ),
        ),
        onPressed: enabled ? onPressed : null);
  }
}
