import 'package:flutter/material.dart';
import 'screens/news_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News!',
      home: NewsList(),
    );
  }
}
