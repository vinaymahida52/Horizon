import 'package:flutter/material.dart';
import 'package:horizon/core/config/router/app_router.dart';
import 'package:horizon/core/config/theme/k_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final route = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Horizon',
      theme: KTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: route.config(),
    );
  }
}
