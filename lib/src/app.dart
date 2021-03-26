import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import '../src/blocs/stories_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hacker News',
        home: NewsList(),
      ),
    );
  }
}
