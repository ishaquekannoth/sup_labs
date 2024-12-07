import 'package:go_router/go_router.dart';
import 'package:sup_labs_task/core/routes/app_routes.dart';
import 'package:sup_labs_task/features/search/presentation/pages/search_view.dart';

import 'unknown_page.dart';

class RouteGenerator {
  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.search,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.search,
        name: AppRoutes.search,
        builder: (context, state) {
          return const SearchView();
        },
      ),
    ],
    errorBuilder: (context, state) => const UnknownPage(),
  );
  static GoRouter get router => _router;
}
