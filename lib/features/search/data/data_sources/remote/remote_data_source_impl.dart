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
      urlPath: "https://fakestoreapi.com/products",
      method: RequestMethod.getRequest,
    );
    return [ProductModelModel.fromJson(response.data)];
  }
}
