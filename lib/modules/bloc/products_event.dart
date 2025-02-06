part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class FetchProductsEvent extends ProductsEvent {
  @override
  List<Object?> get props => [];
}
