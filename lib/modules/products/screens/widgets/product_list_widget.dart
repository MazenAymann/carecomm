import 'package:carecomm/modules/products/screens/widgets/header_product_list_widget.dart';
import 'package:carecomm/modules/products/screens/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/products_bloc.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double paddingHorizontal = screenSize.width * 0.06;
    final double paddingVertical = screenSize.width * 0.03;
    final double paddingTop = screenSize.width * 0.05;
    final double gridSpacing = screenSize.width * 0.05;
    final double childAspectRatio = screenSize.width > 600 ? 0.65 : 0.72;

    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductsFetched) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontal, vertical: paddingVertical),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  HeaderProductListWidget(
                    productsNumber: state.products.length,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenSize.width > 600 ? 3 : 2,
                      crossAxisSpacing: gridSpacing,
                      mainAxisSpacing: gridSpacing,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      final product = state.products[index];

                      return Padding(
                        padding: EdgeInsets.only(top: paddingTop),
                        child: ProductCardWidget(
                          productId: product.id?.toString() ?? '',
                          imageLink: product.image ?? '',
                          title: product.title ?? '',
                          price: product.price.toString(),
                          category: product.category ?? '',
                          description: product.description ?? '',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
