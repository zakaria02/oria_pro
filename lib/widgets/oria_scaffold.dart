import 'package:flutter/material.dart';

import 'oria_app_bar.dart';

class OriaScaffold extends StatelessWidget {
  const OriaScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.padding =
        const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
    this.appBarData,
    this.bottomBarPadding =
        const EdgeInsets.only(bottom: 30, left: 20, right: 20),
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.backgroundColor,
  });
  final Widget body;
  final Widget? bottomNavigationBar;
  final EdgeInsets padding;
  final AppBarData? appBarData;
  final EdgeInsets bottomBarPadding;
  final CrossAxisAlignment crossAxisAlignment;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: [
              if (appBarData != null) ...[
                OriaAppBar(data: appBarData!),
                const SizedBox(
                  height: 16,
                ),
              ],
              body,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: bottomBarPadding,
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: bottomNavigationBar,
        ),
      ),
    );
  }
}
