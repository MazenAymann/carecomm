import 'package:cached_network_image/cached_network_image.dart';
import 'package:carecomm/modules/products/screens/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/colors.dart' as colors;
import '../../../bloc/products_bloc.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.imageLink,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.productId,
  });

  final String imageLink;
  final String productId;
  final String title;
  final dynamic price;
  final String category;
  final String description;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double cardWidth = screenSize.width * 0.42;
    final double cardHeight = screenSize.height * 0.28;
    final double imageSize = cardWidth * 0.6;
    final double fontSize = screenSize.width * 0.04;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) => ProductDetails(
            imageLink: imageLink,
            title: title,
            price: price,
            category: category,
            description: description,
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: cardWidth,
            height: cardHeight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: cardWidth * 0.12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(cardWidth * 0.06),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Image(
                        image: CachedNetworkImageProvider(
                          imageLink,
                          maxHeight: imageSize.toInt(),
                          maxWidth: imageSize.toInt(),
                        ),
                        width: imageSize,
                        height: imageSize,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(
                        color: Colors.black,
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '\$$price',
                      style: GoogleFonts.cairo(
                        color: colors.careCommGrey,
                        fontSize: fontSize * 0.9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -cardHeight * 0.065,
            right: cardWidth * 0.1,
            child: InkWell(
              onTap: () {
                BlocProvider.of<ProductsBloc>(context)
                    .addFavoriteProducts(productId: productId);
              },
              child: Container(
                width: cardWidth * 0.18,
                height: cardWidth * 0.18,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.greenAccent,
                      blurRadius: 0.5,
                      spreadRadius: 0.2,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: cardWidth * 0.12,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
