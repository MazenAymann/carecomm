import 'package:bloc/bloc.dart';
import 'package:carecomm/modules/products/models/product_model.dart';
import 'package:carecomm/modules/products/repositories/products_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required this.productsRepository}) : super(ProductsInitial()) {
    on<FetchProducts>(_fetchProducts);
  }

  ProductsRepository productsRepository;

  Future<void> _fetchProducts(
    FetchProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final products = await productsRepository.getProducts();
      emit(ProductsFetched(products));
    } on NoInternet {
      emit(const NoInternet("No Internet Connection"));
    } catch (e) {
      emit(
        Failure(e.toString()),
      );
    }
  }
}
