import 'package:flutter/material.dart';
import 'package:mytodoapp/provider/todos.dart';
import 'package:provider/provider.dart';

import 'pages/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = "Todo App";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Todosprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white.withOpacity(0.95),
        ),
        home: Homepage(),
      ),
    );
  }
}
