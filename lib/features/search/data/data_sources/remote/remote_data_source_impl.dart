import 'package:dio/dio.dart';
import 'package:sup_labs_task/core/common/extensions/network_enums.dart';
import 'package:sup_labs_task/core/network/dio/dio_services.dart';
import 'package:sup_labs_task/features/search/data/data_sources/remote/remote_data_source.dart';
import 'package:sup_labs_task/features/search/data/model/product_model.dart';

class SearchRemoteDataSourceImpl implements IRemoteSearchDataSource {
  final DioService dioService;
  SearchRemoteDataSourceImpl({required this.dioService});
  @override
  Future<List<ProductModel>> fireTheSearch({required String keyword}) async {
    final Response response = await dioService.makeRESTrequest(
      urlPath: "products",
      method: RequestMethod.getRequest,
    );
    final List productsMap = response.data;
    return List<ProductModel>.from(
        productsMap.map((element) => ProductModel.fromJson(element)));
  }
}
