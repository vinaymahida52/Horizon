import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:horizon/core/config/router/app_router.dart';
import 'package:horizon/core/config/theme/k_theme.dart';
import 'package:horizon/core/observers/riverpod_observer.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(ProviderScope(observers: [LoggingObserver()], child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final route = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return ThemeProvider(
      initTheme: theme.theme,
      builder: (context, theme) {
        return MaterialApp.router(
          title: 'Horizon',
          theme: theme,
          debugShowCheckedModeBanner: false,
          routerConfig: route.config(),
        );
      },
    );
  }
}
