import 'package:cached_network_image/cached_network_image.dart';
import 'package:carecomm/modules/bloc/products_bloc.dart';
import 'package:carecomm/modules/products/models/product_model.dart';
import 'package:carecomm/utils/services/favorite_products_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';

class FavoritesScreen extends StatefulWidget {
  final List<ProductModel> favoriteProducts;
  const FavoritesScreen({
    super.key,
    required this.favoriteProducts,
  });

  static const String routeName = '/favorites';

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    BlocProvider.of<ProductsBloc>(context).getFavoriteProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.favoriteProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animations/empty.json', height: 200),
                  const SizedBox(height: 16),
                  const Text(
                    "No Favorites Yet!",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            )
          : AnimationLimiter(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                itemCount: widget.favoriteProducts.length,
                itemBuilder: (context, index) {
                  final product = widget.favoriteProducts[index];

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50,
                      child: FadeInAnimation(
                        child: Dismissible(
                          key: Key(product.title!),
                          direction: DismissDirection.endToStart,
                          // onDismissed: (_) => _removeItem(index),
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.delete,
                                color: Colors.white, size: 28),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                      imageUrl: product.image!,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    product.title!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                IconButton(
                                    icon: const Icon(Icons.favorite,
                                        color: Colors.red),
                                    onPressed: () {}),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
