part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState({
    required this.currenUser,
    required this.articleFavourites,
    required this.postFavourites,
    required this.expertFavourites,
    required this.programFavourites,
    required this.ressourceType,
  });

  final User? currenUser;
  final List<Favourite> articleFavourites;
  final List<Favourite> postFavourites;
  final List<Favourite> expertFavourites;
  final List<Favourite> programFavourites;
  final FavouriteRessourceType ressourceType;

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {
  const UserInitial()
      : super(
          currenUser: null,
          articleFavourites: const [],
          postFavourites: const [],
          programFavourites: const [],
          expertFavourites: const [],
          ressourceType: FavouriteRessourceType.expert,
        );
}

final class FetchAccountLoading extends UserState {
  const FetchAccountLoading({
    required super.currenUser,
    required super.articleFavourites,
    required super.expertFavourites,
    required super.postFavourites,
    required super.programFavourites,
    required super.ressourceType,
  });
}

final class FetchAccountSuccess extends UserState {
  const FetchAccountSuccess({
    required super.currenUser,
    required super.articleFavourites,
    required super.expertFavourites,
    required super.postFavourites,
    required super.programFavourites,
    required super.ressourceType,
  });
}

final class DeleteAccountLoading extends UserState {
  const DeleteAccountLoading({
    required super.currenUser,
    required super.articleFavourites,
    required super.expertFavourites,
    required super.postFavourites,
    required super.programFavourites,
    required super.ressourceType,
  });
}

final class DeleteAccountSuccess extends UserState {
  const DeleteAccountSuccess({
    required super.currenUser,
    required super.articleFavourites,
    required super.expertFavourites,
    required super.postFavourites,
    required super.programFavourites,
    required super.ressourceType,
  });
}

final class DeleteAccount2FALoading extends UserState {
  const DeleteAccount2FALoading({
    required super.currenUser,
    required super.articleFavourites,
    required super.expertFavourites,
    required super.postFavourites,
    required super.programFavourites,
    required super.ressourceType,
  });
}

final class DeleteAccount2FASuccess extends UserState {
  const DeleteAccount2FASuccess({
    required super.currenUser,
    required super.articleFavourites,
    required super.expertFavourites,
    required super.postFavourites,
    required super.programFavourites,
    required super.ressourceType,
  });
}

final class UpdateUserLoading extends UserState {
  const UpdateUserLoading({
    required super.currenUser,
    required super.articleFavourites,
    required super.expertFavourites,
    required super.postFavourites,
    required super.programFavourites,
    required super.ressourceType,
  });
}

final class UpdateUserSuccess extends UserState {
  const UpdateUserSuccess({
    required super.currenUser,
    required super.articleFavourites,
    required super.expertFavourites,
    required super.postFavourites,
    required super.programFavourites,
    required super.ressourceType,
  });
}

final class UpdatePasswordLoading extends UserState {
  const UpdatePasswordLoading({
    required super.currenUser,
    required super.articleFavourites,
    required super.expertFavourites,
    required super.postFavourites,
    required super.programFavourites,
    required super.ressourceType,
  });
}

final class UpdatePasswordSuccess extends UserState {
  const UpdatePasswordSuccess({
    required super.currenUser,
    required super.articleFavourites,
    required super.expertFavourites,
    required super.postFavourites,
    required super.programFavourites,
    required super.ressourceType,
  });
}

final class FavouriteLoading extends UserState {
  const FavouriteLoading({
    required super.currenUser,
    required super.articleFavourites,
    required super.expertFavourites,
    required super.postFavourites,
    required super.programFavourites,
    required super.ressourceType,
  });
}

final class FavouriteSuccess extends UserState {
  const FavouriteSuccess({
    required super.currenUser,
    required super.articleFavourites,
    required super.expertFavourites,
    required super.postFavourites,
    required super.programFavourites,
    required super.ressourceType,
  });
}

final class UserError extends UserState {
  final String errorMessage;
  const UserError(
      {required super.currenUser,
      required super.articleFavourites,
      required super.expertFavourites,
      required super.postFavourites,
      required super.programFavourites,
      required super.ressourceType,
      required this.errorMessage});
}
