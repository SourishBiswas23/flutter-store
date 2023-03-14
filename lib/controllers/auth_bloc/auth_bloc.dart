import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store/auth/auth.dart';
import 'package:store/routes.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, UserState> {
  AuthBloc() : super(NoUser()) {
    on<GoogleSignInEvent>((event, emit) async {
      await _auth.signInWithGoogle();
      final User? currentUser = await _auth.getCurrentUser();
      if (currentUser != null) {
        emit(UserLoggedIn(user: currentUser));
        while (AppNavigator.navigatorKey.currentState!.canPop()) {
          await AppNavigator.pop();
        }
        await AppNavigator.pushReplace(route: Routes.navBar);
      }
    });
    on<SignOutEvent>(
      (event, emit) async {
        _auth.signOut();
        while (AppNavigator.navigatorKey.currentState!.canPop()) {
          await AppNavigator.pop();
        }
        await AppNavigator.push(route: Routes.loginScreen);
      },
    );
  }
  final Auth _auth = Auth();
}
