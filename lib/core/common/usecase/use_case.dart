import 'package:fpdart/fpdart.dart';
import 'package:sup_labs_task/core/error/failure.dart';

abstract interface class UseCase<T, R> {
  Future<Either<Failure, T>> call({required R parameters});
}

class NoParam {}
