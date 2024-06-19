import 'package:json_annotation/json_annotation.dart';

part 'complain_request_model.g.dart';

@JsonSerializable()
class ComplainPostRequestModel {
  final String postId;

  const ComplainPostRequestModel({required this.postId});

  factory ComplainPostRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ComplainPostRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComplainPostRequestModelToJson(this);
}

@JsonSerializable()
class ComplainCommentRequestModel {
  final String commentId;

  const ComplainCommentRequestModel({required this.commentId});

  factory ComplainCommentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ComplainCommentRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComplainCommentRequestModelToJson(this);
}
