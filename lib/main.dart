import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:store/controllers/auth_bloc/auth_bloc.dart';
import 'package:store/controllers/cart_bloc/cart_bloc.dart';
import 'package:store/controllers/categories_bloc/categories_bloc.dart';
import 'package:store/controllers/payment_bloc/payment_bloc.dart';
import 'package:store/controllers/product_detail_bloc/product_detail_bloc.dart';
import 'package:store/controllers/search_bloc/search_bloc.dart';
import 'package:store/global_theme.dart';
import 'package:store/routes.dart';
import 'package:store/views/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

import 'controllers/favourites_bloc/favourites_bloc.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

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
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
        BlocProvider<PaymentBloc>(
          create: (context) => PaymentBloc(
            cartBloc: BlocProvider.of<CartBloc>(context),
          ),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        home: const LoginScreen(),
        theme: GlobalTheme().lightTheme,
        title: 'Store',
        onGenerateRoute: AppNavigator.onGenerateRoute,
        navigatorKey: AppNavigator.navigatorKey,
        scaffoldMessengerKey: AppNavigator.scaffoldKey,
      ),
    );
  }
}
