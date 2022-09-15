import 'package:calc_clean_arch/presentation/controllers/app_theme_controller.dart';
import 'package:calc_clean_arch/presentation/controllers/basic_calculator_controller.dart';
import 'package:calc_clean_arch/presentation/controllers/basic_history_calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/routes/app_routes.dart';
import 'inject.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BasicCalculatorController(injector()),
        ),

        ChangeNotifierProvider(
          create: (context) => BasicHistoryCalculatorController(injector()),
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
    return ChangeNotifierProvider(
      create: (_) => AppThemeController(injector(), injector()),
      child: Consumer<AppThemeController>(
        builder: (context, appTheme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Calc',
            theme: ThemeData(primarySwatch: Colors.blue),
            onGenerateRoute: AppRoutes.onGenerateRoutes,
          );
        },
      ),
    );
  }
}
