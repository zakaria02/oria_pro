import 'package:flutter/material.dart';

import '../../widgets/oria_card.dart';
import '../../widgets/oria_rounded_image.dart';
import '../entity/author.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({super.key, required this.author});
  final Author author;

  @override
  Widget build(BuildContext context) {
    return OriaCard(
      child: Row(
        children: [
          OriaRoundedImage(
            networkImage: author.imageUrl,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author.name,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                author.expertise,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
