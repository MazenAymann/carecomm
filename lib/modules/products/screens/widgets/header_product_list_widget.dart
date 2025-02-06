import 'package:carecomm/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart' as colors;
import '../../../bloc/products_bloc.dart';
import '../favorites_screen.dart';

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
        InkWell(
          onTap: () => context.pushNamed(FavoritesScreen.routeName,
              arguments:
                  BlocProvider.of<ProductsBloc>(context).favoriteProductsList),
          child: Container(
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
        ),
      ],
    );
  }
}
