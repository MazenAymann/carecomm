import 'package:carecomm/modules/products/data_providers/products_remote_data_provider.dart';
import 'package:carecomm/modules/products/repositories/products_repository.dart';
import 'package:carecomm/modules/products/screens/widgets/product_list_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/helpers/di.dart';
import '../../bloc/products_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xf4ffffff),
        body: SafeArea(child: ProductListWidget()));
  }
}
