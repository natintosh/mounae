import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mounae/routes/page_configuration.dart';

class AppRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final List<Page> _pages = [];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: _onPopPage,
    );
  }

  @override
  PageConfiguration get currentConfiguration => _pages.isNotEmpty
      ? _pages.last.arguments as PageConfiguration
      : SplashRouteConfiguration();

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    _pages.clear();
    _addPage(configuration);
    return SynchronousFuture(null);
  }

  @override
  Future<bool> popRoute() {
    if (_pages.length > 1) {
      _removePage(_pages.last);
      return SynchronousFuture(true);
    }
    return SynchronousFuture(false);
  }

  static AppRouterDelegate of(BuildContext context) {
    return Router.of(context).routerDelegate as AppRouterDelegate;
  }

  bool _onPopPage(Route route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    _pages.removeLast();
    notifyListeners();
    return true;
  }

  void _removePage(Page page) {
    if (page != null) {
      _pages.remove(page);
    }
    notifyListeners();
  }

  Page _createPage(PageConfiguration config) {
    if (kIsWeb) {
      return MaterialPage(
        child: config.child,
        key: ValueKey(config.name),
        name: config.name,
        arguments: config,
      );
    }
    if (Platform.isIOS) {
      return CupertinoPage(
        child: config.child,
        key: ValueKey(config.name),
        name: config.name,
        arguments: config,
      );
    }

    return MaterialPage(
      child: config.child,
      key: ValueKey(config.name),
      name: config.name,
      arguments: config,
    );
  }

  void _addPageData(PageConfiguration config) {
    _pages.add(_createPage(config));
  }

  void _addPage(PageConfiguration config) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).name != config.name;

    if (shouldAddPage) {
      _addPageData(config);
    }

    notifyListeners();
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    _addPage(newRoute);
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
    notifyListeners();
  }

  void replaceAll(PageConfiguration newRoute) {
    setNewRoutePath(newRoute);
  }

  void push(PageConfiguration newRoute) {
    _addPage(newRoute);
  }

  void pushWidget(PageConfiguration newRoute) {
    _addPageData(newRoute);
    notifyListeners();
  }
}
