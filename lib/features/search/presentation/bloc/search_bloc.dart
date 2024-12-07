import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sup_labs_task/core/error/failure.dart';
import 'package:sup_labs_task/features/search/domain/entities/product.dart';
import 'package:sup_labs_task/features/search/domain/use_cases/search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUsecase _searchUsecase;
  SearchBloc({required SearchUsecase useCase})
      : _searchUsecase = useCase,
        super(SearchInitial()) {
    on<SearchEventFireSearch>(_onSearch);
  }

  void _onSearch(SearchEventFireSearch event, Emitter<SearchState> emit) async {
    final result = await _searchUsecase(parameters: event.keyWord);
    result.fold((failure) => emit(SearchFailure(failure: failure)),
        (success) => emit(SearchSuccess(products: success)));
  }
}
