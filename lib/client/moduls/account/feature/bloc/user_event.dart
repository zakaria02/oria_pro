part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class FetchAccount extends UserEvent {}

final class UpdateMedicalInfoSharing extends UserEvent {
  final bool shareMedicalInfo;

  const UpdateMedicalInfoSharing({required this.shareMedicalInfo});
}

final class UpdateUser extends UserEvent {
  final String email;
  final String name;
  final DateTime? birthDay;
  final File? image;

  const UpdateUser({
    required this.email,
    required this.name,
    required this.birthDay,
    required this.image,
  });
}

final class UpdatePassword extends UserEvent {
  final String password;

  const UpdatePassword({
    required this.password,
  });
}

final class FetchFavourite extends UserEvent {
  final FavouriteRessourceType type;

  const FetchFavourite({required this.type});
}

final class RemoveFavourite extends UserEvent {
  final String ressourceId;
  final String ressourceType;

  const RemoveFavourite({
    required this.ressourceId,
    required this.ressourceType,
  });
}

final class DeleteAccount extends UserEvent {}

final class DeleteAccount2FA extends UserEvent {
  final String token;

  const DeleteAccount2FA({
    required this.token,
  });
}
