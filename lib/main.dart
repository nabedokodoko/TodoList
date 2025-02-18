import 'package:flutter/material.dart';
import 'todo_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFD6E3)),
        useMaterial3: true,
        // 上側のバー
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFFFD6E3), // AppBar の色を明示的に設定
        ),
      ),
      // タイトル名
      home: TodoListPage(title: 'To do List'),
    );
  }
}

