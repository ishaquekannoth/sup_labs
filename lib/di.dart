import 'package:get_it/get_it.dart';
import 'package:sup_labs_task/core/network/dio/dio_services.dart';
import 'package:sup_labs_task/features/search/data/data_sources/remote/remote_data_source_impl.dart';
import 'package:sup_labs_task/features/search/data/repositories/search_repo_impl.dart';
import 'package:sup_labs_task/features/search/domain/use_cases/search_usecase.dart';
import 'package:sup_labs_task/features/search/presentation/bloc/search_bloc.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final DioService dioService = DioService.instance;
  serviceLocator.registerLazySingleton(() => dioService);
  _initAuth();
}

_initAuth() {
  serviceLocator.registerFactory(() =>
      SearchRemoteDataSourceImpl(dioService: serviceLocator<DioService>()));
  serviceLocator.registerFactory(() => SearchRepoImpl(
      searchDataSource: serviceLocator<SearchRemoteDataSourceImpl>()));
  serviceLocator.registerFactory(
      () => SearchUsecase(searchRepo: serviceLocator<SearchRepoImpl>()));
  serviceLocator.registerLazySingleton(
      () => SearchBloc(useCase: serviceLocator<SearchUsecase>()));
}
