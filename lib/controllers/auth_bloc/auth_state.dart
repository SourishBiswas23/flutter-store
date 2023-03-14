part of 'auth_bloc.dart';

class UserState extends Equatable {
  UserState();
  late final User user;
  @override
  List<Object> get props => [user];
}

class NoUser extends UserState {}

class UserLoggedIn extends UserState {
  UserLoggedIn({required this.user});
  @override
  final User user;
  @override
  List<Object> get props => [user];
}
