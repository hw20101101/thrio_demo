import 'package:flutter/material.dart';
import 'package:thrio/thrio.dart';
import 'package:thrio_example/src/launch.dart';
import 'module.dart';

void main() => runApp(const MainApp());
void biz1() => runApp(const MainApp(entrypoint: 'biz1'));
void biz2() => runApp(const MainApp(entrypoint: 'biz2'));

class MainApp extends StatefulWidget {
  const MainApp({Key key, String entrypoint = 'main'})
      : _entrypoint = entrypoint,
        super(key: key);

  final String _entrypoint;

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();

    ThrioModule.init(Module(), widget._entrypoint);
  }

  @override
  Widget build(BuildContext context) => ExcludeSemantics(
        child: NavigatorMaterialApp(
          debugShowCheckedModeBanner: false, 
          // home: const NavigatorHome(showRestartButton: true),
          home: new LaunchPage(),

          // builder: (context, child) => Container(
          //   child: child,
          // ),
          theme: ThemeData(
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            }),
          ),
        ),
      );
}
