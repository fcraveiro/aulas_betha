import 'package:aulas_betha/screens/menu/menu.dart';
import 'package:aulas_betha/domain/themes/theme_dark.dart';
import 'package:aulas_betha/domain/themes/theme_light.dart';
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
      home: const Menu(),
    );
  }
}
