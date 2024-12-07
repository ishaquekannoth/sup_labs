part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchEventFireSearch extends SearchEvent {
  final String keyWord;
  const SearchEventFireSearch({required this.keyWord});

  SearchEventFireSearch copyWith({
    String? keyWord,
  }) {
    return SearchEventFireSearch(
      keyWord: keyWord ?? this.keyWord,
    );
  }
}
