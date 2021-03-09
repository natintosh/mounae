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
      observers: [HeroController()],
      pages: List.of(_pages),
      onPopPage: _onPopScreen,
    );
  }

  @override
  PageConfiguration get currentConfiguration =>
      _pages.isNotEmpty ? _pages.last.arguments as PageConfiguration : null;

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    _pages.clear();
    _addScreen(configuration);
    return SynchronousFuture(null);
  }

  @override
  Future<bool> popRoute() {
    if (_pages.length > 1) {
      _removeScreen(_pages.last);
      return SynchronousFuture(true);
    }
    return SynchronousFuture(false);
  }

  static AppRouterDelegate of(BuildContext context) {
    return Router.of(context).routerDelegate as AppRouterDelegate;
  }

  bool _onPopScreen(Route route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    _pages.removeLast();
    notifyListeners();
    return true;
  }

  void _removeScreen(Page page) {
    if (page != null) {
      _pages.remove(page);
    }
    notifyListeners();
  }

  Page _createScreen(PageConfiguration config) {
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

  void _addScreenData(PageConfiguration config) {
    _pages.add(_createScreen(config));
  }

  void _addScreen(PageConfiguration config) {
    final shouldAddScreen = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).name != config.name;

    if (shouldAddScreen) {
      _addScreenData(config);
    }

    notifyListeners();
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    _addScreen(newRoute);
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
    _addScreen(newRoute);
  }

  void pushWidget(PageConfiguration newRoute) {
    _addScreenData(newRoute);
    notifyListeners();
  }
}
