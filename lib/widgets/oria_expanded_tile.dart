import 'package:flutter/material.dart';
import 'package:oria_pro/widgets/oria_card.dart';
import 'package:url_launcher/url_launcher.dart';

class OriaExpandedTile extends StatelessWidget {
  const OriaExpandedTile({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<String> children;

  @override
  Widget build(BuildContext context) {
    return OriaCard(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.zero,
          expandedAlignment: Alignment.topLeft,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: children
              .map(
                (child) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: GestureDetector(
                    onTap: () async => await launchUrl(Uri.parse(child)),
                    child: Text(
                      "\u2022 $child",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
