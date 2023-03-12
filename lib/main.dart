import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controllers/categories_bloc/categories_bloc.dart';
import 'package:store/controllers/product_detail_bloc/product_detail_bloc.dart';
import 'package:store/controllers/search_bloc/search_bloc.dart';
import 'package:store/global_theme.dart';
import 'package:store/routes.dart';
import 'package:store/views/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';

import 'controllers/favourites_bloc/favourites_bloc.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavouritesBloc>(
          create: (context) => FavouritesBloc(),
        ),
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
        BlocProvider<CategoriesBloc>(
          create: (context) => CategoriesBloc(
            searchBloc: BlocProvider.of<SearchBloc>(context),
          ),
        ),
        BlocProvider<ProductDetailBloc>(
          create: (context) => ProductDetailBloc(),
        )
      ],
      child: MaterialApp(
        home: const NavBar(),
        theme: GlobalTheme().lightTheme,
        title: 'Store',
        onGenerateRoute: AppNavigator.onGenerateRoute,
        navigatorKey: AppNavigator.navigatorKey,
      ),
    );
  }
}
