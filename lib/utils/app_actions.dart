import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controllers/auth_bloc/auth_bloc.dart';

class AppActions extends StatelessWidget {
  const AppActions({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: 'signOut',
            child: Text('Sign Out'),
          ),
        ];
      },
      onSelected: (value) {
        if (value == 'signOut') {
          authBloc.add(SignOutEvent());
        }
      },
      icon: const Icon(
        Icons.more_vert,
        color: Colors.deepOrange,
      ),
    );
  }
}
