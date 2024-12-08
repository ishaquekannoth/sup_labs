part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchLoadProducts extends SearchEvent {
  const SearchLoadProducts();

  SearchLoadProducts copyWith({
    String? keyWord,
  }) {
    return const SearchLoadProducts();
  }
}

class SearchEventLocalSearch extends SearchEvent {
  final String keyWord;
  const SearchEventLocalSearch({required this.keyWord});

  SearchEventLocalSearch copyWith({
    String? keyWord,
  }) {
    return SearchEventLocalSearch(
      keyWord: keyWord ?? this.keyWord,
    );
  }
}

class SearchToggleFavourite extends SearchEvent {
  final Product product;
  const SearchToggleFavourite({required this.product});
}
