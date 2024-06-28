import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oria_pro/client/moduls/account/business/locator/account_locator.dart';
import 'package:oria_pro/client/moduls/account/feature/entity/favourite_ressource_type.dart';
import 'package:oria_pro/client/moduls/account/feature/use_case/fetch_favourite_use_case.dart';
import 'package:oria_pro/client/moduls/account/feature/use_case/update_share_medical_info.dart';
import 'package:oria_pro/client/moduls/account/feature/use_case/update_user_info_usecase.dart';
import 'package:oria_pro/client/moduls/explore/business/di/explore_locator.dart';
import 'package:oria_pro/client/moduls/explore/business/repository/explore_repository.dart';
import 'package:oria_pro/common/auth/business/email_password/locator/email_password_locator.dart';
import 'package:oria_pro/common/auth/business/email_password/model/user_model.dart';
import 'package:oria_pro/common/auth/business/local_data_source/auth_local_data_source.dart';
import 'package:oria_pro/common/entity/user.dart';
import 'package:oria_pro/common/favourites/locator/favourite_locator.dart';
import 'package:oria_pro/common/favourites/model/expert_favourite_model.dart';
import 'package:oria_pro/common/favourites/model/favorite_request_model.dart';
import 'package:oria_pro/common/favourites/model/learning_content_favourite_model.dart';
import 'package:oria_pro/common/favourites/model/post_favourite_model.dart';
import 'package:oria_pro/common/favourites/repository/favourite_repository.dart';

import '../../../../../common/auth/business/email_password/model/update_profile_request_model.dart';
import '../../../../../common/auth/business/email_password/repository/email_password_repository.dart';
import '../entity/favourite.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    on<FetchAccount>((event, emit) async {
      try {
        final AuthLocalDataSource authLocalDataSource =
            EmailPasswordAuthLocator().get();
        final user = await authLocalDataSource.getUser();
        emit(FetchAccountSuccess(
          currenUser: user?.toUser(),
          postFavourites: state.postFavourites,
          articleFavourites: state.articleFavourites,
          expertFavourites: state.expertFavourites,
          programFavourites: state.programFavourites,
          ressourceType: state.ressourceType,
        ));
      } catch (e) {
        UserError(
            currenUser: state.currenUser,
            postFavourites: state.postFavourites,
            articleFavourites: state.articleFavourites,
            expertFavourites: state.expertFavourites,
            programFavourites: state.programFavourites,
            ressourceType: state.ressourceType,
            errorMessage: e.toString());
      }
    });

    on<UpdateUser>((event, emit) async {
      final UpdateMyInfoUseCase usecase = EmailPasswordAuthLocator().get();
      try {
        emit(UpdateUserLoading(
          currenUser: state.currenUser,
          postFavourites: state.postFavourites,
          articleFavourites: state.articleFavourites,
          expertFavourites: state.expertFavourites,
          programFavourites: state.programFavourites,
          ressourceType: state.ressourceType,
        ));
        final updated = await usecase.execute(
          state.currenUser!,
          event.email,
          event.name,
          event.birthDay,
          event.image,
        );
        if (updated) {
          add(FetchAccount());
        } else {
          emit(UserError(
              currenUser: state.currenUser,
              postFavourites: state.postFavourites,
              articleFavourites: state.articleFavourites,
              expertFavourites: state.expertFavourites,
              programFavourites: state.programFavourites,
              ressourceType: state.ressourceType,
              errorMessage: "Error while updating current user"));
        }
      } catch (e) {
        UserError(
            currenUser: state.currenUser,
            postFavourites: state.postFavourites,
            articleFavourites: state.articleFavourites,
            expertFavourites: state.expertFavourites,
            programFavourites: state.programFavourites,
            ressourceType: state.ressourceType,
            errorMessage: e.toString());
      }
    });

    on<UpdatePassword>((event, emit) async {
      final EmailPasswordRepository repository =
          EmailPasswordAuthLocator().get();

      try {
        emit(UpdatePasswordLoading(
          currenUser: state.currenUser,
          postFavourites: state.postFavourites,
          articleFavourites: state.articleFavourites,
          expertFavourites: state.expertFavourites,
          programFavourites: state.programFavourites,
          ressourceType: state.ressourceType,
        ));
        await repository.updateProfileInfo(UpdateProfileRequestModel(
          password: event.password,
        ));
        emit(UpdatePasswordSuccess(
          currenUser: state.currenUser,
          postFavourites: state.postFavourites,
          articleFavourites: state.articleFavourites,
          expertFavourites: state.expertFavourites,
          programFavourites: state.programFavourites,
          ressourceType: state.ressourceType,
        ));
      } catch (e) {
        UserError(
            currenUser: state.currenUser,
            postFavourites: state.postFavourites,
            articleFavourites: state.articleFavourites,
            expertFavourites: state.expertFavourites,
            programFavourites: state.programFavourites,
            ressourceType: state.ressourceType,
            errorMessage: e.toString());
      }
    });

    on<UpdateMedicalInfoSharing>((event, emit) async {
      final UpdateShareMedicalInfoUseCase usecase =
          EmailPasswordAuthLocator().get();
      final AuthLocalDataSource authLocalDataSource =
          EmailPasswordAuthLocator().get();
      try {
        emit(UpdateUserLoading(
          currenUser: state.currenUser,
          postFavourites: state.postFavourites,
          articleFavourites: state.articleFavourites,
          expertFavourites: state.expertFavourites,
          programFavourites: state.programFavourites,
          ressourceType: state.ressourceType,
        ));
        final updated = await usecase.execute(
          event.shareMedicalInfo,
        );
        if (updated) {
          final user = await authLocalDataSource.getUser();
          final updatedUser =
              user!.copyWith(shareMedicalInfo: event.shareMedicalInfo);
          await authLocalDataSource.saveUser(updatedUser);
          emit(UpdateUserSuccess(
            currenUser: updatedUser.toUser(),
            postFavourites: state.postFavourites,
            articleFavourites: state.articleFavourites,
            expertFavourites: state.expertFavourites,
            programFavourites: state.programFavourites,
            ressourceType: state.ressourceType,
          ));
        } else {
          emit(UserError(
              currenUser: state.currenUser,
              postFavourites: state.postFavourites,
              articleFavourites: state.articleFavourites,
              expertFavourites: state.expertFavourites,
              programFavourites: state.programFavourites,
              ressourceType: state.ressourceType,
              errorMessage: "Error while updating current user"));
        }
      } catch (e) {
        UserError(
            currenUser: state.currenUser,
            postFavourites: state.postFavourites,
            articleFavourites: state.articleFavourites,
            expertFavourites: state.expertFavourites,
            programFavourites: state.programFavourites,
            ressourceType: state.ressourceType,
            errorMessage: e.toString());
      }
    });

    on<FetchFavourite>((event, emit) async {
      try {
        final FetchFavouriteUseCase useCase = AccountLocator().get();
        emit(FavouriteLoading(
          currenUser: state.currenUser,
          postFavourites: state.postFavourites,
          articleFavourites: state.articleFavourites,
          expertFavourites: state.expertFavourites,
          programFavourites: state.programFavourites,
          ressourceType: event.type,
        ));
        final favourites = await useCase.execute(event.type);
        emit(FavouriteSuccess(
          currenUser: state.currenUser,
          postFavourites: event.type == FavouriteRessourceType.post
              ? favourites
              : state.postFavourites,
          articleFavourites: event.type == FavouriteRessourceType.article
              ? favourites
              : state.articleFavourites,
          expertFavourites: event.type == FavouriteRessourceType.expert
              ? favourites
              : state.expertFavourites,
          programFavourites: event.type == FavouriteRessourceType.program
              ? favourites
              : state.programFavourites,
          ressourceType: event.type,
        ));
      } catch (e) {
        UserError(
            currenUser: state.currenUser,
            postFavourites: state.postFavourites,
            articleFavourites: state.articleFavourites,
            expertFavourites: state.expertFavourites,
            programFavourites: state.programFavourites,
            ressourceType: state.ressourceType,
            errorMessage: e.toString());
      }
    });

    on<RemoveFavourite>((event, emit) async {
      try {
        final FavouriteRepository repository = FavouriteLocator().get();
        final ExploreRepository exploreRepository = ExploreLocator().get();
        emit(FavouriteLoading(
          currenUser: state.currenUser,
          postFavourites: state.postFavourites,
          articleFavourites: state.articleFavourites,
          expertFavourites: state.expertFavourites,
          programFavourites: state.programFavourites,
          ressourceType: state.ressourceType,
        ));
        if (state.ressourceType == FavouriteRessourceType.post) {
          await exploreRepository.unFavoritePost(event.ressourceId);
        } else {
          await repository.removeFavorite(
            FavoriteRequestModel(
              resourceId: event.ressourceId,
              resourceType: event.ressourceType,
            ),
          );
        }
        List<Favourite> updatedFavs = switch (state.ressourceType) {
          FavouriteRessourceType.post => (await repository.postFavourites())
              .map((fav) => fav.toFavourite())
              .nonNulls
              .toList(),
          FavouriteRessourceType.article =>
            (await repository.articleFavourites())
                .map((fav) => fav.toFavourite())
                .toList(),
          FavouriteRessourceType.program =>
            (await repository.programFavourites())
                .map((fav) => fav.toFavourite())
                .toList(),
          FavouriteRessourceType.expert => (await repository.expertFavourites())
              .map((fav) => fav.toFavourite())
              .toList(),
        };
        emit(FavouriteSuccess(
          currenUser: state.currenUser,
          postFavourites: state.ressourceType == FavouriteRessourceType.post
              ? updatedFavs
              : state.postFavourites,
          articleFavourites:
              state.ressourceType == FavouriteRessourceType.article
                  ? updatedFavs
                  : state.articleFavourites,
          expertFavourites: state.ressourceType == FavouriteRessourceType.expert
              ? updatedFavs
              : state.expertFavourites,
          programFavourites:
              state.ressourceType == FavouriteRessourceType.program
                  ? updatedFavs
                  : state.programFavourites,
          ressourceType: state.ressourceType,
        ));
      } catch (e) {
        UserError(
            currenUser: state.currenUser,
            postFavourites: state.postFavourites,
            articleFavourites: state.articleFavourites,
            expertFavourites: state.expertFavourites,
            programFavourites: state.programFavourites,
            ressourceType: state.ressourceType,
            errorMessage: e.toString());
      }
    });
  }
}
