part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<Product> products;
  const SearchSuccess({required this.products});
  @override
  List<Object> get props => [products];
  @override
  bool? get stringify => true;
}

final class SearchFailure extends SearchState {
  final Failure failure;

  const SearchFailure({required this.failure});
}
