import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart' as colors;

class HeaderProductListWidget extends StatelessWidget {
  const HeaderProductListWidget({super.key, required this.productsNumber});

  final dynamic productsNumber;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double fontSize = screenSize.width > 600 ? 24 : 20;
    final double iconSize = screenSize.width > 600 ? 24 : 20;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$productsNumber Results',
          style: GoogleFonts.cairo(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 2),
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 0.5,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Icon(
            Icons.favorite,
            size: iconSize,
            color: colors.favColorNavBar,
          ),
        ),
      ],
    );
  }
}
