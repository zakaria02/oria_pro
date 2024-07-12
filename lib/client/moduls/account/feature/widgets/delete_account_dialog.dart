import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:oria_pro/utils/router/router.dart';
import 'package:oria_pro/widgets/oria_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../utils/constants/oria_colors.dart';
import '../../../../../widgets/oria_rounded_button.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return OriaDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(SvgAssets.warningIcon),
          Text(
            AppLocalizations.of(context)!.deleteAccount,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: "Raleway",
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.delete_account_sure,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          OriaRoundedButton(
            height: 42,
            padding: EdgeInsets.zero,
            onPress: () {
              context.pushRoute(const DeleteAccountEmailRoute());
            },
            text: AppLocalizations.of(context)!.delete,
          ),
          const SizedBox(height: 8),
          OriaRoundedButton(
            height: 42,
            padding: EdgeInsets.zero,
            primaryColor: Colors.white,
            textColor: OriaColors.green,
            borderColor: OriaColors.green,
            onPress: () {
              Navigator.of(context).pop();
            },
            text: AppLocalizations.of(context)!.cancel,
          ),
        ],
      ),
    );
  }
}
