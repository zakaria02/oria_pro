import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../utils/constants/oria_colors.dart';
import '../../../../utils/constants/svg_assets.dart';
import '../../../../widgets/oria_dialog.dart';
import '../../../../widgets/oria_icon_button.dart';
import '../../../../widgets/oria_rounded_button.dart';
import '../entity/symptom_info.dart';

class SymptomCard extends StatelessWidget {
  const SymptomCard({
    super.key,
    required this.symptom,
    required this.selected,
    required this.onPress,
    this.onDelete,
  });
  final SymptomInfo symptom;
  final bool selected;
  final VoidCallback onPress;
  final VoidCallback? onDelete;

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return OriaDialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(SvgAssets.warningIcon),
              Text(
                AppLocalizations.of(context)!.deleteSymptom,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: "Raleway",
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.sureDeleteSymptom,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              OriaRoundedButton(
                padding: EdgeInsets.zero,
                onPress: () {
                  onDelete!();
                  Navigator.of(context).pop();
                },
                text: AppLocalizations.of(context)!.delete,
              ),
              const SizedBox(height: 8),
              OriaRoundedButton(
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        InkWell(
          onTap: onPress,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 5),
                  blurStyle: BlurStyle.inner,
                ),
              ],
              border: selected
                  ? Border.all(
                      color: OriaColors.primaryColor,
                      width: 2,
                    )
                  : null,
            ),
            padding: const EdgeInsets.all(6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  symptom.icon,
                  height: 48,
                  width: 48,
                  color: OriaColors.primaryColor,
                ),
                const SizedBox(height: 10),
                Text(
                  symptom.name,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: OriaColors.primaryColor),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        if (onDelete != null)
          Padding(
            padding: const EdgeInsets.only(right: 3, top: 3),
            child: Align(
              alignment: Alignment.topRight,
              child: OriaIconButton(
                url: SvgAssets.closeAsset,
                onPress: () => _showDialog(context),
                size: 10,
                raduis: 10,
                backgroundColor: OriaColors.disabledColor,
                color: Colors.black,
              ),
            ),
          ),
      ],
    );
  }
}
