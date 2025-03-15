import 'package:auto_route/auto_route.dart';
import 'package:horizon/core/config/router/app_router.gr.dart';
import 'package:horizon/core/config/router/route_name/route_names.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: Routes.splash, initial: true),
        AutoRoute(page: LoginRoute.page, path: Routes.login),
        AutoRoute(
            page: ManagerDashboardRoute.page, path: Routes.managerDashboard),
        AutoRoute(
          page: ProjectListRoute.page,
          path: Routes.viewProjects,
        ),
      ];
}
