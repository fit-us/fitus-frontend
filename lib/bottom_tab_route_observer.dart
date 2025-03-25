import 'package:flutter/material.dart';

// 라우트 옵저버를 통해 페이지(라우트)변경을 감지하여 표시 여부
class BottomTabRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  final Function(bool) onShowBottomTab;

  final List<String> routesWithoutBottomTab = [
    '/record-select-moment',
    '/record-select-emotion',
    '/record-select-expressions',
    '/record-select-description',
  ];

  BottomTabRouteObserver({required this.onShowBottomTab});

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _updateBottomTabVisibility(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (route.settings.name == '/record-select-moment' &&
        previousRoute?.settings.name == '/') {
      onShowBottomTab(true);
    } else if (previousRoute != null) {
      _updateBottomTabVisibility(previousRoute);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      _updateBottomTabVisibility(newRoute);
    }
  }

  void _updateBottomTabVisibility(Route<dynamic> route) {
    if (route is PageRoute) {
      final routeName = route.settings.name;
      final hideBottomTab =
          routeName != null && routesWithoutBottomTab.contains(routeName);
      final show = !hideBottomTab;
      onShowBottomTab(show);
    }
  }
}
