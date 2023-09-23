import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page,initial: true),
    AutoRoute(page: HomeRoute.page,path: '/users'),
    AutoRoute(page: UserDetailRoute.page,path: '/users/:userId'),
  ];
}