import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sup_labs_task/core/error/common_failures.dart';
import 'package:sup_labs_task/core/error/failure.dart';
import 'package:sup_labs_task/core/error/network_exceptions.dart';
import 'package:sup_labs_task/features/search/data/data_sources/remote/remote_data_source.dart';
import 'package:sup_labs_task/features/search/domain/entities/product.dart';
import 'package:sup_labs_task/features/search/domain/repositories/search_repo.dart';

class SearchRepoImpl implements ISearchRepo {
  final IRemoteSearchDataSource searchDataSource;

  SearchRepoImpl({required this.searchDataSource});
  @override
  Future<Either<Failure, List<Product>>> searchProducts(
      {required String name}) async {
    try {
      final List<Product> result =
          await searchDataSource.fireTheSearch(keyword: name);
      return right(result);
    } on DioException catch (err) {
      return left(NetworkFailure.fromDioError(
        dioError: err,
      ));
    } catch (error) {
      return left(DefaultFailure(message: error.toString()));
    }
  }
}
