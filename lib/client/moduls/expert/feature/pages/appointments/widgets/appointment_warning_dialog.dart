import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';

class AppointmentWarningDialog extends StatelessWidget {
  const AppointmentWarningDialog({
    super.key,
    required this.title,
    required this.subTitle,
    this.description,
  });

  final String title;
  final String subTitle;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          SvgAssets.warningIcon,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontFamily: "Raleway",
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w400,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        if (description != null)
          Text(
            description!,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
        const SizedBox(height: 24),
        OriaRoundedButton(
          padding: EdgeInsets.zero,
          onPress: () => Navigator.of(context).pop(),
          text: "Ok",
          primaryColor: OriaColors.gold,
          textColor: Colors.white,
        )
      ],
    );
  }
}
