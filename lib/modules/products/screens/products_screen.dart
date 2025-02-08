import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/products_bloc.dart';

import 'widgets/product_list_widget.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = "/products";
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
      ),
      body: const ProductListWidget(),
    );
  }
}
