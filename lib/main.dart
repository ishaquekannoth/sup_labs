import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sup_labs_task/core/routes/route_generator.dart';
import 'package:sup_labs_task/di.dart';
import 'package:sup_labs_task/features/search/presentation/bloc/search_bloc.dart';

void main() async {
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      enableScaleText: () => true,
      enableScaleWH: () => true,
      ensureScreenSize: true,
      fontSizeResolver: (fontSize, instance) => fontSize * 1,
      minTextAdapt: true,
      rebuildFactor: (old, data) => old != data,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => serviceLocator<SearchBloc>()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: RouteGenerator.router,
          title: 'E-Commerce App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
