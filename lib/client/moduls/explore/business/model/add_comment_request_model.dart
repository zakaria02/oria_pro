import 'package:json_annotation/json_annotation.dart';

part 'add_comment_request_model.g.dart';

@JsonSerializable()
class AddCommentRequestModel {
  final String comment;
  @JsonKey(includeIfNull: false)
  final String? parentId;

  const AddCommentRequestModel({
    required this.comment,
    this.parentId,
  });

  factory AddCommentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddCommentRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddCommentRequestModelToJson(this);
}
