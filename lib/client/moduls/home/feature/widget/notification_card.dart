import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oria_pro/client/moduls/account/feature/widgets/user_image.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/bloc/forum_bloc.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/pages/post_details_page.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/utils/extensions/date_extensions.dart';

import '../bloc/notification_bloc.dart';
import '../entity/notification.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
  });
  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ForumBloc(),
        ),
      ],
      child: BlocBuilder<ForumBloc, ForumState>(
        builder: (forumContext, forumState) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<NotificationBloc>(context)
                  .add(MarkNotificationAsRead(id: notification.id));
              if (notification.context == NotificationContext.post) {
                BlocProvider.of<ForumBloc>(forumContext)
                    .add(FetchPostDetails(postId: notification.resourceId));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider.value(
                          value: BlocProvider.of<ForumBloc>(
                            forumContext,
                          ),
                          child: const PostDetailsPage());
                    },
                  ),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      const UserImage(userImage: null, size: 48),
                      if (!notification.read)
                        Positioned(
                          top: 4,
                          right: 2,
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF3B3B),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification.content,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          notification.updatedAt
                              .toNamedDayDateWithHourAndMinute()!,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  color: OriaColors.grey,
                                  fontFamily: "satoshi"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
