part of 'products_bloc.dart';

@immutable
sealed class ProductsState extends Equatable {
  const ProductsState();
}

final class ProductsInitial extends ProductsState {
  @override
  List<Object?> get props => [];
}

final class ProductsLoading extends ProductsState {
  @override
  List<Object?> get props => [];
}

final class ProductsFetched extends ProductsState {
  final List<ProductModel> products;

  const ProductsFetched(this.products);

  @override
  List<Object?> get props => [products];
}

final class FavoritesFetched extends ProductsState {
  final List<ProductModel> favoriteProducts;

  const FavoritesFetched(this.favoriteProducts);

  @override
  List<Object?> get props => [favoriteProducts];
}

final class NoInternet extends ProductsState {
  final String message;

  const NoInternet(this.message);

  @override
  List<Object?> get props => [message];
}

final class Failure extends ProductsState {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}
