import 'package:bloc/bloc.dart';
import 'package:carecomm/modules/products/models/product_model.dart';
import 'package:carecomm/modules/products/repositories/products_repository.dart';
import 'package:carecomm/utils/services/favorite_products_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required this.productsRepository}) : super(ProductsInitial()) {
    on<FetchProductsEvent>(_fetchProducts);
  }

  ProductsRepository productsRepository;
  List<ProductModel> products = [];
  final List<ProductModel> favoriteProductsList = [];
  Future<void> _fetchProducts(
    FetchProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      products = await productsRepository.getProducts();
      emit(ProductsFetched(products));
    } on NoInternet {
      emit(const NoInternet("No Internet Connection"));
    } catch (e) {
      emit(
        Failure(e.toString()),
      );
    }
  }

  void getFavoriteProducts() async {
    final favoriteProducts =
        await FavoriteProductsService().getFavoriteProducts();

    for (String productId in favoriteProducts) {
      final product = products.firstWhere((product) => product.id == productId);
      favoriteProductsList.add(product);
    }
    print(favoriteProductsList[0].title);
  }

  void addFavoriteProducts({required String productId}) async {
    await FavoriteProductsService().addProductToFavorites(productId);
    print(productId);
  }

  void removeFavoriteProducts({required String productId}) async {
    await FavoriteProductsService().removeProductFromFavorites(productId);
  }

  @override
  Future<void> close() {
    productsRepository.dispose();
    return super.close();
  }
}
