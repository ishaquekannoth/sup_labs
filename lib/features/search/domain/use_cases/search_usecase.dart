import 'package:fpdart/fpdart.dart';
import 'package:sup_labs_task/core/common/usecase/use_case.dart';
import 'package:sup_labs_task/core/error/failure.dart';
import 'package:sup_labs_task/features/search/domain/entities/product.dart';
import 'package:sup_labs_task/features/search/domain/repositories/search_repo.dart';

class SearchUsecase implements UseCase<List<Product>, String> {
  final ISearchRepo searchRepo;
  SearchUsecase({required this.searchRepo});
  @override
  Future<Either<Failure, List<Product>>> call(
      {required String parameters}) async {
    return await searchRepo.searchProducts(name: parameters);
  }
}
