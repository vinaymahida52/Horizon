// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:horizon/features/auth/login/login_screen.dart' as _i1;
import 'package:horizon/features/manager/home/manager_dashboard_screen.dart'
    as _i2;
import 'package:horizon/features/project/project_list_screen.dart' as _i3;
import 'package:horizon/features/spalsh/screen/splash_screen.dart' as _i4;

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen();
    },
  );
}

/// generated route for
/// [_i2.ManagerDashboardScreen]
class ManagerDashboardRoute extends _i5.PageRouteInfo<void> {
  const ManagerDashboardRoute({List<_i5.PageRouteInfo>? children})
    : super(ManagerDashboardRoute.name, initialChildren: children);

  static const String name = 'ManagerDashboardRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.ManagerDashboardScreen();
    },
  );
}

/// generated route for
/// [_i3.ProjectListScreen]
class ProjectListRoute extends _i5.PageRouteInfo<void> {
  const ProjectListRoute({List<_i5.PageRouteInfo>? children})
    : super(ProjectListRoute.name, initialChildren: children);

  static const String name = 'ProjectListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProjectListScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}
