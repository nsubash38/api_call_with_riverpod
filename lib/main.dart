import 'package:api_call_with_riverpod/features/posts/ui/screens/posts_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'APICall with Riverpod',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PostsListScreen());
  }
}
