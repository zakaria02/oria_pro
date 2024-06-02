import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/forum_topic.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/topic_post.dart';
import 'package:oria_pro/client/moduls/explore/feature/forum/widgets/tag_card.dart';
import 'package:oria_pro/utils/constants/oria_colors.dart';
import 'package:oria_pro/widgets/oria_app_bar.dart';
import 'package:oria_pro/widgets/oria_rounded_button.dart';
import 'package:oria_pro/widgets/oria_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../utils/constants/svg_assets.dart';
import '../../../../../../widgets/oria_snack_bar.dart';
import '../bloc/forum_bloc.dart';

class AddTopicPostPage extends StatefulWidget {
  const AddTopicPostPage({
    super.key,
    required this.topic,
    this.editablePost,
  });

  final ForumTopic topic;
  final TopicPost? editablePost;

  @override
  State<AddTopicPostPage> createState() => _AddTopicPostPageState();
}

class _AddTopicPostPageState extends State<AddTopicPostPage> {
  late String title;
  late String content;
  late List<String> tags;
  final tagConroller = TextEditingController();

  final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: OriaColors.disabledColor),
  );
  final focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: OriaColors.green),
  );
  TextStyle? hintStyle(context) =>
      Theme.of(context).textTheme.labelMedium?.copyWith(
            color: OriaColors.disabledColor,
          );

  @override
  void initState() {
    title = widget.editablePost?.title ?? "";
    content = widget.editablePost?.content ?? "";
    tags = widget.editablePost?.tags ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumBloc, ForumState>(
      listener: (context, state) {
        if (state is ForumError) {
          ScaffoldMessenger.of(context).showSnackBar(
            OriaErrorSnackBar(
              content: state.errorMessage,
            ),
          );
        }
        if (state is AddPostSuccess) {
          context.maybePop();
        }
      },
      builder: (blocContext, state) {
        return OriaScaffold(
          appBarData: AppBarData(
            firstButtonUrl: SvgAssets.backAsset,
            onFirstButtonPress: () => context.maybePop(),
            title: widget.topic.title,
          ),
          body: Expanded(
            child: ListView(
              children: [
                TextFormField(
                  cursorColor: OriaColors.green,
                  decoration: InputDecoration(
                    border: inputBorder,
                    focusedBorder: focusBorder,
                    hintText: AppLocalizations.of(context)!.postTitle,
                    hintStyle: hintStyle(context),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  ),
                  style: Theme.of(context).textTheme.displayLarge,
                  initialValue: title,
                  onChanged: (value) {
                    title = value;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  cursorColor: OriaColors.green,
                  decoration: InputDecoration(
                    border: inputBorder,
                    focusedBorder: focusBorder,
                    hintText: AppLocalizations.of(context)!.writeTextHere,
                    hintStyle: hintStyle(context),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  ),
                  style: Theme.of(context).textTheme.labelMedium,
                  minLines: 15,
                  maxLines: 25,
                  initialValue: content,
                  onChanged: (value) {
                    content = value;
                  },
                ),
                const SizedBox(height: 12),
                Text(
                  AppLocalizations.of(context)!.hashtags,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: tagConroller,
                  decoration: InputDecoration(
                    border: inputBorder,
                    focusedBorder: focusBorder,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    hintText: AppLocalizations.of(context)!.tag,
                    hintStyle: hintStyle(context),
                    suffixIconConstraints: const BoxConstraints(
                      maxHeight: 48,
                      maxWidth: 48,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (tagConroller.text.isNotEmpty) {
                            tags.add(tagConroller.text);
                            tagConroller.text = "";
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: OriaColors.iconButtonBackgound,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          height: 25,
                          child: SvgPicture.asset(SvgAssets.addIcon),
                        ),
                      ),
                    ),
                  ),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 22),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 16,
                  runSpacing: 16,
                  children: tags
                      .map(
                        (tag) => TagCard(
                          tag: tag,
                          onDelete: () {
                            setState(() {
                              tags.remove(tag);
                            });
                          },
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: OriaRoundedButton(
              onPress: () {
                if (widget.editablePost == null) {
                  BlocProvider.of<ForumBloc>(context).add(
                    AddPost(
                      topic: widget.topic,
                      title: title,
                      content: content,
                      tags: tags,
                    ),
                  );
                }
              },
              height: 48,
              padding: EdgeInsets.zero,
              isLoading: state is AddPostLoading,
              text: AppLocalizations.of(context)!.publish,
            ),
          ),
        );
      },
    );
  }
}
