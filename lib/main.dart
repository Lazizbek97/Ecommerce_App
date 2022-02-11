import 'package:ecommerce/core/utils/route.dart';
import 'package:ecommerce/core/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  RouteGenerator route = RouteGenerator();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MainTheme.light,
      initialRoute: "/",
      onGenerateRoute: route.routeGenerate,
    );
  }
}
