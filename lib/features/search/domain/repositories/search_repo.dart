import 'package:fpdart/fpdart.dart';
import 'package:sup_labs_task/core/error/failure.dart';
import 'package:sup_labs_task/features/search/domain/entities/product.dart';

abstract interface class ISearchRepo {
  Future<Either<Failure, List<Product>>> searchProducts({required String name});
}
