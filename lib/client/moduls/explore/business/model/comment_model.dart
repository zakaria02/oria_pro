import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/explore/feature/entity/comment.dart';
import 'post_user_model.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {
  final String? parentId;
  final String comment;
  final PostUserModel userId;
  final String postId;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  final String id;
  final List<CommentModel> subComments;
  final int likeCount;
  final bool isOwner;

  const CommentModel({
    required this.parentId,
    required this.comment,
    required this.userId,
    required this.postId,
    required this.createdAt,
    required this.id,
    this.subComments = const [],
    this.likeCount = 0,
    this.isOwner = false,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}

extension CommentModelMapper on CommentModel {
  Comment toComment({bool? owner}) => Comment(
        parentId: parentId,
        comment: comment,
        user: userId.toPostUser(),
        postId: postId,
        createdAt: createdAt,
        id: id,
        subComments: subComments.map((comm) => comm.toComment()).toList(),
        likeCount: likeCount,
        isOwner: owner ?? isOwner,
      );
}
