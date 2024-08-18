import 'package:aulas_betha/menu.dart';
import 'package:aulas_betha/domain/themes/theme_dark.dart';
import 'package:aulas_betha/domain/themes/theme_light.dart';
import 'package:aulas_betha/pages/fernando/lib/size/size.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeLight(),
      darkTheme: themeDark(),
      themeMode: ThemeMode.light,
      home: const MediaQueryInitializer(
        child: Menu(),
      ),
    );
  }
}

class MediaQueryInitializer extends StatelessWidget {
  final Widget child;
  const MediaQueryInitializer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    MediaQuerySize(context);
    return child;
  }
}
