part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GoogleSignInEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}
