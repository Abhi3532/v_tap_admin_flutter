// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:v_tap_admin_flutter/pages/home_page.dart' as _i1;
import 'package:v_tap_admin_flutter/pages/login_page.dart' as _i2;
import 'package:v_tap_admin_flutter/pages/user_detail_screen.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    UserDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UserDetailRouteArgs>(
          orElse: () =>
              UserDetailRouteArgs(userId: pathParams.getString('userId')));
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.UserDetailPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.UserDetailPage]
class UserDetailRoute extends _i4.PageRouteInfo<UserDetailRouteArgs> {
  UserDetailRoute({
    _i5.Key? key,
    required String userId,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          UserDetailRoute.name,
          args: UserDetailRouteArgs(
            key: key,
            userId: userId,
          ),
          rawPathParams: {'userId': userId},
          initialChildren: children,
        );

  static const String name = 'UserDetailRoute';

  static const _i4.PageInfo<UserDetailRouteArgs> page =
      _i4.PageInfo<UserDetailRouteArgs>(name);
}

class UserDetailRouteArgs {
  const UserDetailRouteArgs({
    this.key,
    required this.userId,
  });

  final _i5.Key? key;

  final String userId;

  @override
  String toString() {
    return 'UserDetailRouteArgs{key: $key, userId: $userId}';
  }
}
