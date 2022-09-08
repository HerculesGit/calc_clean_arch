import 'package:calc_clean_arch/presentation/controllers/basic_calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/routes/app_routes.dart';
import 'inject.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              BasicCalculatorController(initBasicServiceDependencies()),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
