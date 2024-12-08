import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sup_labs_task/core/error/failure.dart';
import 'package:sup_labs_task/features/search/data/model/product_model.dart';
import 'package:sup_labs_task/features/search/domain/entities/product.dart';
import 'package:sup_labs_task/features/search/domain/use_cases/search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUsecase _searchUsecase;
  List<ProductModel> allProducts = [];
  SearchBloc({required SearchUsecase useCase})
      : _searchUsecase = useCase,
        super(SearchInitial()) {
    on<SearchLoadProducts>(_onLoadProducts);
    on<SearchEventLocalSearch>(_onSearch);
    on<SearchToggleFavourite>(_toggleFavourite);
  }

  void _onLoadProducts(
      SearchLoadProducts event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final result = await _searchUsecase(parameters: '');
    result.fold((failure) => emit(SearchFailure(failure: failure)), (success) {
      allProducts = success as List<ProductModel>;
      emit(SearchSuccess(products: success));
    });
  }

  void _onSearch(
      SearchEventLocalSearch event, Emitter<SearchState> emit) async {
    if (event.keyWord.isEmpty) {
      return emit(SearchSuccess(products: allProducts));
    }
    final List<Product> filteredProducts = allProducts
        .where((product) =>
            product.title.toLowerCase().contains(event.keyWord.toLowerCase()))
        .toList();
    if (filteredProducts.isNotEmpty) {
      emit(SearchSuccess(products: filteredProducts));
    } else {
      emit(SearchSuccess(products: allProducts));
    }
  }

  void _toggleFavourite(
      SearchToggleFavourite event, Emitter<SearchState> emit) async {
    final List<Product> products = (state as SearchSuccess).products;
    final updatedProducts = products.map((product) {
      if (product.id == event.product.id) {
        return (product as ProductModel).toggleFavourite();
      }
      return product;
    }).toList();
    emit((state as SearchSuccess).copyWith(products: updatedProducts));
  }
}
