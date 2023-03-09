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
    return MaterialApp(
      home: const NavBar(),
      title: 'Store',
      onGenerateRoute: AppNavigator.onGenerateRoute,
      navigatorKey: AppNavigator.navigatorKey,
    );
  }
}
