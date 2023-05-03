import 'package:flutter/material.dart';

import 'package:provider_flutter/screens/screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portafolio',
      home: const HomeScreem(),
      initialRoute: '/home', // Cambia esto
      routes: {
        '/home': (context) => const HomeScreem(), // y esto
        'pos_cat': (context) => const PosCatScreen()
      },
      theme: ThemeData.light(),
    );
  }
}
