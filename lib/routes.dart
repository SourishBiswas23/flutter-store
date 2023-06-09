import 'package:store/views/loading_screen/loading_screen.dart';
import 'package:store/views/cart_screen/cart_screen.dart';
import 'package:store/views/favourites_screen/favourites_screen.dart';
import 'package:store/views/home_screen/home_screen.dart';
import 'package:store/views/login_screen/login_screen.dart';
import 'package:store/views/nav_bar/nav_bar.dart';
import 'package:store/views/order_placed_screen.dart/order_placed.dart';
import 'package:store/views/page_not_found_screen/page_not_found_screen.dart';
import 'package:store/views/payment_screen/payment_screen.dart';
import 'package:store/views/product_detail_screen/product_detail_screen.dart';
import 'package:store/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

enum Routes {
  splashScreen,
  cartScreen,
  pageNotFoundScreen,
  favouritesScreen,
  homeScreen,
  productDetailScreen,
  paymentScreen,
  loginScreen,
  navBar,
  loadingScreen,
  orderPlacedScreen,
}

class _Paths {
  static const String splashScreen = '/';
  static const String pageNotFoundScreen = '/pageNotFound';
  static const String cartScreen = '/cartScreen';
  static const String favouritesScreen = '/favouritesScreen';
  static const String homeScreen = '/homeScreen';
  static const String productDetailScreen = '/productDetailScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String loginScreen = '/loginScreen';
  static const String navBar = '/navbar';
  static const String loadingScreen = '/loadingScreen';
  static const String orderPlacedScreen = '/orderPlacedScreen';

  static const Map<Routes, String> _pathMap = {
    Routes.splashScreen: splashScreen,
    Routes.cartScreen: cartScreen,
    Routes.pageNotFoundScreen: pageNotFoundScreen,
    Routes.favouritesScreen: favouritesScreen,
    Routes.homeScreen: homeScreen,
    Routes.productDetailScreen: productDetailScreen,
    Routes.paymentScreen: paymentScreen,
    Routes.loginScreen: loginScreen,
    Routes.navBar: navBar,
    Routes.loadingScreen: loadingScreen,
    Routes.orderPlacedScreen: orderPlacedScreen,
  };

  static String of(Routes route) => _pathMap[route] ?? pageNotFoundScreen;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.cartScreen:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );
      case _Paths.favouritesScreen:
        return MaterialPageRoute(
          builder: (context) => const FavouritesScreen(),
        );
      case _Paths.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case _Paths.productDetailScreen:
        return MaterialPageRoute(
          builder: (context) => const ProductDetailScreen(),
        );
      case _Paths.pageNotFoundScreen:
        return MaterialPageRoute(
          builder: (context) => const PageNotFoundScreen(),
        );
      case _Paths.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case _Paths.paymentScreen:
        return MaterialPageRoute(
          builder: (context) => const PaymentScreen(),
        );
      case _Paths.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case _Paths.navBar:
        return MaterialPageRoute(
          builder: (context) => const NavBar(),
        );
      case _Paths.loadingScreen:
        return MaterialPageRoute(
          builder: (context) => const LoadingScreen(),
        );
      case _Paths.orderPlacedScreen:
        return MaterialPageRoute(
          builder: (context) => const OrderPlacedScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const PageNotFoundScreen(),
        );
    }
  }

  static Future? push({required Routes route}) {
    return navigatorKey.currentState?.pushNamed(_Paths.of(route));
  }

  static Future? pushReplace({required Routes route}) {
    return navigatorKey.currentState?.pushReplacementNamed(_Paths.of(route));
  }

  static pop() {
    navigatorKey.currentState?.pop();
  }
}
