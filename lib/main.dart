import 'package:flutter/material.dart';
import 'package:test_app/provider/stock.dart';
import 'package:test_app/screens/detail_screen.dart';
import 'package:test_app/screens/search_screen.dart';
import 'package:provider/provider.dart';

import '/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Stock(),
        )
      ],
      child: MaterialApp(
        title: 'Stock',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          SearchScreen.routeName: (ctx) => SearchScreen(),
          DetailScreen.routeName: (ctx) => DetailScreen(),
        },
      ),
    );
  }
}
