import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'oria_icon_button.dart';

class OriaAppBar extends StatelessWidget {
  const OriaAppBar({
    super.key,
    required this.data,
  });
  final AppBarData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: data.userImage != null
              ? Image.asset(data.userImage!)
              : data.firstButtonUrl != null
                  ? OriaIconButton(
                      onPress: data.onFirstButtonPress,
                      url: data.firstButtonUrl!,
                    )
                  : const SizedBox(
                      width: 48,
                    ),
        ),
        Flexible(
          flex: 4,
          child: Align(
            alignment: data.centerTitle ? Alignment.center : Alignment.topLeft,
            child: SizedBox(
              child: data.title != null
                  ? AutoSizeText(
                      data.title!,
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    )
                  : null,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: data.lastButtonUrl != null
              ? OriaIconButton(
                  onPress: data.onLastButtonPress,
                  url: data.lastButtonUrl!,
                )
              : const SizedBox(
                  width: 48,
                ),
        ),
      ],
    );
  }
}

class AppBarData {
  final String? firstButtonUrl;
  final String? lastButtonUrl;
  final String? title;
  final VoidCallback? onFirstButtonPress;
  final VoidCallback? onLastButtonPress;
  final bool centerTitle;
  final String? userImage;

  const AppBarData({
    this.firstButtonUrl,
    this.lastButtonUrl,
    this.title,
    this.onFirstButtonPress,
    this.onLastButtonPress,
    this.centerTitle = true,
    this.userImage,
  });
}
