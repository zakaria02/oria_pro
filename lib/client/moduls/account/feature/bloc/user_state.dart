part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState({required this.currenUser});

  final User? currenUser;

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {
  const UserInitial() : super(currenUser: null);
}

final class FetchAccountLoading extends UserState {
  const FetchAccountLoading({required super.currenUser});
}

final class FetchAccountSuccess extends UserState {
  const FetchAccountSuccess({required super.currenUser});
}

final class UpdateUserLoading extends UserState {
  const UpdateUserLoading({required super.currenUser});
}

final class UpdateUserSuccess extends UserState {
  const UpdateUserSuccess({required super.currenUser});
}

final class UserError extends UserState {
  final String errorMessage;
  const UserError({required super.currenUser, required this.errorMessage});
}
