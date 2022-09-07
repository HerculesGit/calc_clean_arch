import 'package:flutter/material.dart';

import 'config/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calc',
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
