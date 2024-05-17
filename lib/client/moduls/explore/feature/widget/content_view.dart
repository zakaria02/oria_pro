import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/utils/constants/svg_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../widgets/oria_badge.dart';
import '../../../../../widgets/oria_icon_button.dart';
import '../entity/learning_content.dart';
import '../programs/entity/program.dart';

class ContentView extends StatelessWidget {
  const ContentView({
    super.key,
    required this.content,
    required this.onItemPeress,
  });
  final LearningContent content;
  final Function(String, String) onItemPeress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              content.symptomName,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontFamily: "Marcellus",
                  ),
            ),
            if (content.isPrimarySymptom) ...[
              const SizedBox(width: 8),
              SvgPicture.asset(SvgAssets.primaryStarIcon),
            ],
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 186,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: content.articles.length,
            itemBuilder: (context, index) => ArticleCard(
              article: content.articles[index],
              onItemPeress: onItemPeress,
              type: content.type,
            ),
          ),
        ),
      ],
    );
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    this.article,
    this.program,
    this.type,
    this.onItemPeress,
  }) : assert((article != null && type != null) || program != null);
  final SymptomArticle? article;
  final Program? program;
  final LearningContentType? type;
  final Function(String, String)? onItemPeress;

  @override
  Widget build(BuildContext context) {
    String badgeText = "";
    if (article?.finished == true) {
      badgeText = AppLocalizations.of(context)!.finished;
    } else if (article != null && type != null) {
      switch (type) {
        case LearningContentType.article:
          badgeText = AppLocalizations.of(context)!.minutes(article!.duration);
          break;
        case LearningContentType.program:
          badgeText =
              AppLocalizations.of(context)!.daysCount(article!.duration);
          break;
        default:
          badgeText = "";
      }
    } else {
      badgeText = AppLocalizations.of(context)!.daysCount(program!.duration);
    }
    return GestureDetector(
      onTap: onItemPeress == null
          ? () {}
          : () => article != null
              ? onItemPeress!(article!.id, article!.title)
              : onItemPeress!(program!.id, program!.title),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 12,
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                width: 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 118,
                      width: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(
                            article != null
                                ? article!.thumbnail
                                : program!.imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.13),
                            blurRadius: 4,
                            offset: const Offset(0.0, 4),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 4),
                      child: Text(
                        article != null ? article!.title : program!.title,
                        style: Theme.of(context).textTheme.labelLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible:
                article != null ? article!.duration > 0 : program!.duration > 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 9),
              child: SizedBox(
                width: 210,
                child: Row(
                  children: [
                    OriaBadge(
                      title: badgeText,
                      isTime: article?.finished != true,
                    ),
                    const Spacer(),
                    Visibility(
                      visible: article != null ? article!.isPremium : false,
                      child: const OriaIconButton(
                        url: SvgAssets.premiumIcon,
                        size: 13,
                        raduis: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
