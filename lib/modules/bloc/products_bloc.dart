import 'package:bloc/bloc.dart';
import 'package:carecomm/modules/products/models/product_model.dart';
import 'package:carecomm/modules/products/repositories/products_repository.dart';
import 'package:carecomm/utils/services/favorite_products_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required this.productsRepository}) : super(ProductsInitial()) {
    on<FetchProductsEvent>(_fetchProducts);
    on<FetchFavoritesEvent>(_fetchFavoriteProducts);
    on<AddFavoriteEvent>(_addFavoriteProduct);
    on<RemoveFavoriteEvent>(_removeFavoriteProduct);
  }

  final ProductsRepository productsRepository;
  List<ProductModel> products = [];
  List<ProductModel> favoriteProductsList = [];

  Future<void> _fetchProducts(
    FetchProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      products = await productsRepository.getProducts();
      emit(ProductsFetched(products));
    } on NoInternet {
      emit(NoInternet("No Internet Connection"));
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }

  Future<void> _fetchFavoriteProducts(
    FetchFavoritesEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(FavoritesLoading());
    favoriteProductsList.clear();

    final favoriteProductIds =
        await FavoriteProductsService().getFavoriteProducts();

    for (String productId in favoriteProductIds) {
      final product = products.firstWhere((product) => product.id == productId);
      if (!favoriteProductsList.contains(product)) {
        favoriteProductsList.add(product);
      }
    }

    emit(FavoritesLoaded(favoriteProductsList));
  }

  Future<void> _addFavoriteProduct(
    AddFavoriteEvent event,
    Emitter<ProductsState> emit,
  ) async {
    await FavoriteProductsService().addProductToFavorites(event.productId);
    add(FetchFavoritesEvent());
  }

  Future<void> _removeFavoriteProduct(
    RemoveFavoriteEvent event,
    Emitter<ProductsState> emit,
  ) async {
    await FavoriteProductsService().removeProductFromFavorites(event.productId);
    add(FetchFavoritesEvent());
  }

  @override
  Future<void> close() {
    productsRepository.dispose();
    return super.close();
  }
}
