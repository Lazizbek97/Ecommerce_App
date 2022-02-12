import 'package:ecommerce/core/hive/hive_init.dart';
import 'package:ecommerce/core/utils/route.dart';
import 'package:ecommerce/core/utils/theme.dart';
import 'package:ecommerce/provider/hive_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitialize.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HiveProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RouteGenerator route = RouteGenerator();

  @override
  void dispose() {
    Hive.close();
  }

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
