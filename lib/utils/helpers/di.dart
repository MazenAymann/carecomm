import 'package:carecomm/modules/bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:carecomm/modules/products/data_providers/products_remote_data_provider.dart';
import 'package:carecomm/modules/products/repositories/products_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<ProductsRemoteDataProvider>(
    () => ProductsRemoteDataProvider(dio: getIt<Dio>()),
  );

  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepository(apiProvider: getIt<ProductsRemoteDataProvider>()),
  );

  getIt.registerFactory<ProductsBloc>(
    () => ProductsBloc(productsRepository: getIt<ProductsRepository>()),
  );
}
