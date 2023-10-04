import 'package:flutter/material.dart';
import 'package:giphy_search/di/providers.dart';
import 'package:giphy_search/presentation/search_screen/search_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: SearchPage(),
      ),
    );
  }
}
