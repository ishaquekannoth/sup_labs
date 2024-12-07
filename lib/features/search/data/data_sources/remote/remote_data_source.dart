import 'package:sup_labs_task/features/search/domain/entities/product.dart';

abstract interface class IRemoteSearchDataSource {
  Future<List<Product>> fireTheSearch({required String keyword});
}
