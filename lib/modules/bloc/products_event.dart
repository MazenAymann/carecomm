part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProductsEvent extends ProductsEvent {}

class FetchFavoritesEvent extends ProductsEvent {}

class AddFavoriteEvent extends ProductsEvent {
  final String productId;

  AddFavoriteEvent(this.productId);

  @override
  List<Object> get props => [productId];
}

class RemoveFavoriteEvent extends ProductsEvent {
  final String productId;

  RemoveFavoriteEvent(this.productId);

  @override
  List<Object> get props => [productId];
}
