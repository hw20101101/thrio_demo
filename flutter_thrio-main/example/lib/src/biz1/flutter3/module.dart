import 'package:flutter/widgets.dart';
import 'package:thrio/thrio.dart';

import 'flutter3_page.dart' as flutter3;

class Module
    with
        ThrioModule,
        ModulePageBuilder,
        ModuleRouteObserver,
        NavigatorRouteObserver {
  @override
  String get key => 'flutter3';

  @override
  void onPageBuilderSetting(ModuleContext moduleContext) {
    pageBuilder = (settings) => flutter3.Flutter3Page(
          index: settings.index,
          params: settings.params,
        );
  }

  @override
  void onRouteObserverRegister(ModuleContext moduleContext) {
    registerRouteObserver(this);
  }

  @override
  void didPush(RouteSettings routeSettings) {}

  @override
  void didPop(RouteSettings routeSettings) {}

  @override
  void didPopTo(RouteSettings routeSettings) {}

  @override
  void didRemove(RouteSettings routeSettings) {}
}
