import 'package:flutter/material.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/forum_topic.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({
    super.key,
    required this.topic,
    required this.onPress,
  });

  final ForumTopic topic;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onPress,
        child: OriaCard(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      topic.thumbnail,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            topic.title,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          AppLocalizations.of(context)!.posts(topic.postsCount),
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: OriaColors.disabledColor,
                                    fontFamily: "Satoshi",
                                  ),
                          textAlign: TextAlign.right,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      topic.description,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: const Color(0xFF535353),
                            fontWeight: FontWeight.w300,
                            fontFamily: "Satoshi",
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
