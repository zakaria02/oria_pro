import 'package:json_annotation/json_annotation.dart';

import '../../../../../utils/constants/oria_links.dart';
import '../../feature/entity/post_user.dart';

part 'post_user_model.g.dart';

@JsonSerializable()
class PostUserModel {
  final String? profilePicture;
  final String name;
  final String id;
  final String role;

  const PostUserModel({
    required this.profilePicture,
    required this.name,
    required this.id,
    required this.role,
  });

  factory PostUserModel.fromJson(Map<String, dynamic> json) =>
      _$PostUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostUserModelToJson(this);
}

extension PostUserModelMapper on PostUserModel {
  PostUser toPostUser() => PostUser(
        profilePicture: profilePicture == null
            ? null
            : profilePicture!.contains("http")
                ? profilePicture
                : "${OriaLinks.stagingProfileAssetsBaseUrl}/$profilePicture",
        name: name,
        id: id,
        isExpert: role == "expert",
      );
}
