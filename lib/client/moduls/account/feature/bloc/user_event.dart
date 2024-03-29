part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class FetchAccount extends UserEvent {}

final class UpdateUser extends UserEvent {
  final String email;
  final String name;
  final DateTime? birthDay;

  const UpdateUser({
    required this.email,
    required this.name,
    required this.birthDay,
  });
}
