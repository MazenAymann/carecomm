import 'package:carecomm/modules/products/data_providers/products_remote_data_provider.dart';
import 'package:carecomm/utils/helpers/global_interfaces/repository_interface.dart';

import '../models/product_model.dart';

class ProductsRepository implements IRepository {
  final ProductsRemoteDataProvider apiProvider;

  ProductsRepository({required this.apiProvider});

  Future<ProductModel> getProducts() => apiProvider.getProducts();

  @override
  void dispose() => apiProvider.cancelAnyRunningRequest();
}
