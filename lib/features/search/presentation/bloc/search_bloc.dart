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
    result.fold(
        (failure) => emit(SearchFailure(failure: failure)),
        (success) =>
            emit(SearchSuccess(products: success as List<ProductModel>)));
  }

  void _onSearch(
      SearchEventLocalSearch event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final result = await _searchUsecase(parameters: event.keyWord);

    result.fold(
        (failure) => emit(SearchFailure(failure: failure)),
        (success) =>
            emit(SearchSuccess(products: success as List<ProductModel>)));
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
