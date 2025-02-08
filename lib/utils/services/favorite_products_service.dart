import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProductsService {
  static const String _favoriteProductsKey = 'favorite_products';

  Future<void> addProductToFavorites(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteProducts =
        prefs.getStringList(_favoriteProductsKey) ?? [];
    if (!favoriteProducts.contains(productId)) {
      favoriteProducts.add(productId);
      await prefs.setStringList(_favoriteProductsKey, favoriteProducts);
    }
  }

  Future<List<String>> getFavoriteProducts() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoriteProductsKey) ?? [];
  }

  Future<void> removeProductFromFavorites(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteProducts =
        prefs.getStringList(_favoriteProductsKey) ?? [];
    favoriteProducts.remove(productId);
    await prefs.setStringList(_favoriteProductsKey, favoriteProducts);
  }

  Future<void> clearFavoriteProducts() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoriteProductsKey);
  }

  Future<void> dispose() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoriteProductsKey);
  }
}
