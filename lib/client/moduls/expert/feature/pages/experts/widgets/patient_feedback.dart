import 'package:flutter/material.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/review.dart';
import 'package:oria_pro/utils/constants/png_assets.dart';
import 'package:oria_pro/widgets/oria_rounded_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../utils/constants/oria_colors.dart';

class PatientFeedback extends StatefulWidget {
  const PatientFeedback({
    super.key,
    required this.review,
  });
  final Review review;

  @override
  State<PatientFeedback> createState() => _PatientFeedbackState();
}

class _PatientFeedbackState extends State<PatientFeedback> {
  int maxLines = 3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OriaRoundedImage(
            networkImage: widget.review.profilePicture,
            assetImage: widget.review.profilePicture == null
                ? PngAssets.womanAsset
                : null,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.review.username,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.review.review,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                      ),
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      maxLines = maxLines == 3 ? 100 : 3;
                    });
                  },
                  child: Text(
                    maxLines == 3
                        ? AppLocalizations.of(context)!.readMore
                        : AppLocalizations.of(context)!.readLess,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: OriaColors.darkOrange,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
