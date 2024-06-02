import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:oria_pro/widgets/oria_snack_bar.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../../utils/constants/oria_colors.dart';
import '../../../../../widgets/oria_loading_progress.dart';
import '../entity/forum_topic.dart';
import 'bloc/forum_bloc.dart';
import 'pages/topic_posts_page.dart';
import 'widgets/topic_card.dart';

class ForumView extends StatefulWidget {
  const ForumView({super.key});

  @override
  State<ForumView> createState() => _ForumViewState();
}

class _ForumViewState extends State<ForumView> {
  final TextEditingController _controller = TextEditingController();
  final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  List<ForumTopic> otherTopics = [];
  List<ForumTopic> recommondedTopics = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForumBloc()..add(FetchTopics()),
      child: BlocConsumer<ForumBloc, ForumState>(
        listener: (context, state) {
          if (state is ForumError) {
            ScaffoldMessenger.of(context).showSnackBar(
              OriaErrorSnackBar(content: state.errorMessage),
            );
          }
          if (state is ForumTopicsSuccess) {
            setState(() {
              otherTopics = state.otherTopics;
              recommondedTopics = state.recommondedTopics;
            });
          }
        },
        builder: (blocContext, state) => Padding(
          padding: const EdgeInsets.only(top: 10),
          child: state is ForumTopicsLoading
              ? const Column(
                  children: [
                    OriaLoadingProgress(),
                  ],
                )
              : Column(
                  children: [
                    TypeAheadField(
                      controller: _controller,
                      builder: (context, controller, focusNode) {
                        return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            border: inputBorder,
                            enabledBorder: inputBorder,
                            focusedBorder: inputBorder,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: OriaColors.disabledColor,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: OriaColors.disabledColor,
                                ),
                            fillColor: Colors.white,
                            labelText: AppLocalizations.of(context)!.typeATopic,
                            labelStyle: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: OriaColors.disabledColor,
                                ),
                          ),
                          style: Theme.of(context).textTheme.displayMedium,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                otherTopics = state.otherTopics;
                                recommondedTopics = state.recommondedTopics;
                              });
                            } else {
                              setState(() {
                                recommondedTopics = state.recommondedTopics
                                    .where((topic) => topic.title
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                                otherTopics = state.otherTopics
                                    .where((topic) => topic.title
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              });
                            }
                          },
                        );
                      },
                      suggestionsCallback: (pattern) {
                        return [
                          ...state.recommondedTopics.where((topic) => topic
                              .title
                              .toLowerCase()
                              .contains(pattern.toLowerCase())),
                          ...state.otherTopics.where((topic) => topic.title
                              .toLowerCase()
                              .contains(pattern.toLowerCase())),
                        ];
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(
                            suggestion.title,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        );
                      },
                      onSelected: (suggestion) {
                        setState(() {
                          _controller.text = suggestion.title;
                          recommondedTopics = state.recommondedTopics
                              .where((topic) => topic.title
                                  .toLowerCase()
                                  .contains(suggestion.title.toLowerCase()))
                              .toList();
                          otherTopics = state.otherTopics
                              .where((topic) => topic.title
                                  .toLowerCase()
                                  .contains(suggestion.title.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: VisibilityDetector(
                        key: const Key("forum_list"),
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction == 0) {
                            setState(() {
                              otherTopics = state.otherTopics;
                              recommondedTopics = state.recommondedTopics;
                            });
                          }
                        },
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            if (recommondedTopics.isNotEmpty) ...[
                              Text(
                                AppLocalizations.of(context)!.recommendation,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                              const SizedBox(height: 18),
                              ...recommondedTopics.map(
                                (topic) => TopicCard(
                                  topic: topic,
                                  onPress: () {
                                    BlocProvider.of<ForumBloc>(blocContext).add(
                                      FetchTopicPosts(topic: topic),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider.value(
                                              value: BlocProvider.of<ForumBloc>(
                                                blocContext,
                                              ),
                                              child:
                                                  TopicPostsPage(topic: topic));
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                            if (otherTopics.isNotEmpty) ...[
                              Text(
                                AppLocalizations.of(context)!.otherTopics,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                              const SizedBox(height: 18),
                              ...otherTopics.map(
                                (topic) => TopicCard(
                                  topic: topic,
                                  onPress: () {
                                    BlocProvider.of<ForumBloc>(blocContext).add(
                                      FetchTopicPosts(topic: topic),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider.value(
                                              value: BlocProvider.of<ForumBloc>(
                                                blocContext,
                                              ),
                                              child:
                                                  TopicPostsPage(topic: topic));
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
