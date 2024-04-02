import 'package:flutter/material.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/widgets/oria_rounded_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../widgets/oria_rounded_button.dart';

class AppointmentCancelDialog extends StatelessWidget {
  const AppointmentCancelDialog({
    super.key,
    required this.expertPicture,
    required this.onYesPress,
  });

  final String expertPicture;
  final VoidCallback onYesPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        OriaRoundedImage(networkImage: expertPicture),
        Text(
          AppLocalizations.of(context)!.wantToCancel,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontFamily: "Raleway",
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          AppLocalizations.of(context)!.cancelActionIsFinal,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w400,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        OriaRoundedButton(
          padding: EdgeInsets.zero,
          onPress: () {
            Navigator.of(context).pop();
            onYesPress.call();
          },
          text: AppLocalizations.of(context)!.yes,
        ),
        const SizedBox(height: 8),
        OriaRoundedButton(
          padding: EdgeInsets.zero,
          onPress: () => Navigator.of(context).pop(),
          text: AppLocalizations.of(context)!.no,
          primaryColor: Colors.white,
          borderColor: OriaColors.green,
          textColor: OriaColors.green,
        ),
      ],
    );
  }
}
