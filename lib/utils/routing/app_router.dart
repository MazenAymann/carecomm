import 'package:carecomm/modules/products/models/product_model.dart';
import 'package:carecomm/modules/products/screens/favorites_screen.dart';
import 'package:carecomm/modules/products/screens/products_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ProductsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ProductsScreen());

      case FavoritesScreen.routeName:
        {
          final arguments = settings.arguments as List<ProductModel>;

          return MaterialPageRoute(
              builder: (_) => FavoritesScreen(favoriteProducts: arguments));
        }
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
