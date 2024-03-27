import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';

import '../entity/author.dart';

part 'author_model.g.dart';

@JsonSerializable()
class AuthorModel {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "profilePicture")
  final String imageUrl;
  @JsonKey(name: "expertise")
  final String expertise;

  const AuthorModel(
      {required this.name, required this.imageUrl, required this.expertise});

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
}

extension AuthorModelMappers on AuthorModel {
  Author toAuthor() {
    return Author(
      name: name,
      imageUrl: "${OriaLinks.stagingAuthorsAssetsBaseUrl}/$imageUrl",
      expertise: expertise,
    );
  }
}
