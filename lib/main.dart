import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controllers/bloc/favourites_bloc.dart';
import 'package:store/routes.dart';
import 'package:store/views/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouritesBloc(),
      child: MaterialApp(
        home: const NavBar(),
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light().copyWith(
            primary: Colors.deepOrange,
            secondary: Colors.deepOrange,
          ),
        ),
        title: 'Store',
        onGenerateRoute: AppNavigator.onGenerateRoute,
        navigatorKey: AppNavigator.navigatorKey,
      ),
    );
  }
}
