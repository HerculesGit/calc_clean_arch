import 'package:flutter/material.dart';

import '../../presentation/views/basic_calculate_view.dart';
import 'routes_contants.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case kBasicCalculateView:
        return _materialRoute(const BasicCalculateView());
      default:
        return _materialRoute(Scaffold(
          body: Column(
            children: const [Text('Route not found')],
          ),
        ));
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
