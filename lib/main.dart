import 'package:flutter/material.dart';

import 'core/services/providers.dart';
import 'features/home/presentation/ui/page/home_page.dart';

void main() {
  setUpProviders();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Lato Regular',
      ),
      home: const HomePage(),
    );
  }
}

