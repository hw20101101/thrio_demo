import 'package:flutter/widgets.dart';
import 'package:thrio/thrio.dart';

import 'flutter2_page.dart' as flutter2;

class Module
    with ThrioModule, ModulePageBuilder, ModuleRouteTransitionsBuilder {
  @override
  String get key => 'flutter2';

  @override
  void onPageBuilderSetting(ModuleContext moduleContext) {
    pageBuilder = (settings) => flutter2.Flutter2Page(
          index: settings.index,
          params: settings.params,
        );
  }

  @override
  void onRouteTransitionsBuilderSetting(ModuleContext moduleContext) {
    // 赋值为 null 可以清楚父级 module 设置的转场动画
    routeTransitionsBuilder = null;
  }

    @override
  void didAppear(RouteSettings routeSettings) {
    ThrioLogger.v('flutter2 didAppear: $routeSettings');
  }

  @override
  void didDisappear(RouteSettings routeSettings) {
    ThrioLogger.v('flutter2 didDisappear: $routeSettings');
  }

  @override
  void willAppear(RouteSettings routeSettings) {
    ThrioLogger.v('flutter2 willAppear: $routeSettings');
  }

  @override
  void willDisappear(RouteSettings routeSettings) {
    ThrioLogger.v('flutter2 willDisappear: $routeSettings');
  }
}
