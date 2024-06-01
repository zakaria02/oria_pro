import 'package:json_annotation/json_annotation.dart';

part 'add_forum_post_request_model.g.dart';

@JsonSerializable()
class AddForumPostRequestModel {
  final String title;
  final String content;
  final List<String> tags;

  const AddForumPostRequestModel({
    required this.title,
    required this.content,
    required this.tags,
  });

  factory AddForumPostRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddForumPostRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddForumPostRequestModelToJson(this);
}
