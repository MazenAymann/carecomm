import 'package:carecomm/modules/products/models/product_model.dart';
import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart' as apis;
import '../../../utils/helpers/global_interfaces/remote_data_provider_interface.dart';

class ProductsRemoteDataProvider implements IRemoteDataProvider {
  final Dio dio;
  final CancelToken _cancelToken = CancelToken();

  ProductsRemoteDataProvider({required this.dio});

  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get(
      apis.products,
      cancelToken: _cancelToken,
    );
    List<dynamic> jsonList = response.data;
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }

  @override
  void cancelAnyRunningRequest() => _cancelToken.cancel("cancelled");
}
