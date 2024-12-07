import 'package:sup_labs_task/features/search/data/model/product_model.dart';

abstract interface class IRemoteSearchDataSource {
  Future<List<ProductModel>> fireTheSearch({required String keyword});
}
