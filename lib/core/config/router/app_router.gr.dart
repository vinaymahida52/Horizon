// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:horizon/features/auth/login/login_screen.dart' as _i1;
import 'package:horizon/features/manager/home/manager_dashboard_screen.dart'
    as _i2;
import 'package:horizon/features/project/view/project_detail_screen.dart'
    as _i3;
import 'package:horizon/features/project/view/project_list_screen.dart' as _i4;
import 'package:horizon/features/spalsh/screen/splash_screen.dart' as _i5;

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen();
    },
  );
}

/// generated route for
/// [_i2.ManagerDashboardScreen]
class ManagerDashboardRoute extends _i6.PageRouteInfo<void> {
  const ManagerDashboardRoute({List<_i6.PageRouteInfo>? children})
      : super(ManagerDashboardRoute.name, initialChildren: children);

  static const String name = 'ManagerDashboardRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.ManagerDashboardScreen();
    },
  );
}

/// generated route for
/// [_i3.ProjectDetailScreen]
class ProjectDetailRoute extends _i6.PageRouteInfo<ProjectDetailRouteArgs> {
  ProjectDetailRoute({
    _i7.Key? key,
    required String projectId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ProjectDetailRoute.name,
          args: ProjectDetailRouteArgs(key: key, projectId: projectId),
          initialChildren: children,
        );

  static const String name = 'ProjectDetailRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProjectDetailRouteArgs>();
      return _i3.ProjectDetailScreen(key: args.key, projectId: args.projectId);
    },
  );
}

class ProjectDetailRouteArgs {
  const ProjectDetailRouteArgs({this.key, required this.projectId});

  final _i7.Key? key;

  final String projectId;

  @override
  String toString() {
    return 'ProjectDetailRouteArgs{key: $key, projectId: $projectId}';
  }
}

/// generated route for
/// [_i4.ProjectListScreen]
class ProjectListRoute extends _i6.PageRouteInfo<void> {
  const ProjectListRoute({List<_i6.PageRouteInfo>? children})
      : super(ProjectListRoute.name, initialChildren: children);

  static const String name = 'ProjectListRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProjectListScreen();
    },
  );
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}
