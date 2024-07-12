import 'package:json_annotation/json_annotation.dart';

part 'delete_account_model.g.dart';

@JsonSerializable()
class DeleteAccountModel {
  final String token;

  const DeleteAccountModel({
    required this.token,
  });

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteAccountModelToJson(this);
}
