import 'package:flutter/material.dart';
import 'package:html_parsed_read_more/html_parsed_read_more.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: const Column(
        children: [
          HtmlParsedReadMore(
            readLessText: 'Read less',
            readMoreText: 'Read more',
            maxLinesReadLess: 3,
            maxLinesReadMore: 1000,
            textOverflow: TextOverflow.ellipsis,
            fontFamily: 'poppins',
            textButtonFontSize: 14.0,
            text:
                '<strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</strong>',
          )
        ],
      ),
    );
  }
}
