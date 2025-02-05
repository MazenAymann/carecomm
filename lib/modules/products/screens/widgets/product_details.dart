import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/colors.dart' as colors;

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.imageLink,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
  });

  final String imageLink;
  final String title;
  final dynamic price;
  final String category;
  final String description;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.8,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20), // Add a border radius here
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 4,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
          ),
          const SizedBox(height: 10),
          Image(
            image: CachedNetworkImageProvider(imageLink),
            width: screenSize.width * 0.5,
            height: screenSize.height * 0.2,
          ),
          const SizedBox(height: 30),
          Text(
            '$title - $category',
            style: GoogleFonts.cairo(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Description',
              style: GoogleFonts.cairo(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: GoogleFonts.cairo(
              color: colors.careCommGrey,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Text(
            '\$$price',
            style: GoogleFonts.cairo(
              color: colors.careCommGrey,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
