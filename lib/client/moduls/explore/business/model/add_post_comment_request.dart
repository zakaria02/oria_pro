import 'package:json_annotation/json_annotation.dart';

part 'add_post_comment_request.g.dart';

@JsonSerializable()
class AddPostCommentRequest {
  final String comment;
  final String? parentId;

  const AddPostCommentRequest({
    required this.comment,
    this.parentId,
  });

  factory AddPostCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$AddPostCommentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddPostCommentRequestToJson(this);
}
