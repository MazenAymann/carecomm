part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsFetched extends ProductsState {
  final List<ProductModel> products;

  ProductsFetched(this.products);

  @override
  List<Object> get props => [products];
}

class NoInternet extends ProductsState {
  final String message;

  NoInternet(this.message);

  @override
  List<Object> get props => [message];
}

class Failure extends ProductsState {
  final String error;

  Failure(this.error);

  @override
  List<Object> get props => [error];
}

class FavoritesLoading extends ProductsState {}

class FavoritesLoaded extends ProductsState {
  final List<ProductModel> favoriteProducts;

  FavoritesLoaded(this.favoriteProducts);

  @override
  List<Object> get props => [favoriteProducts];
}
