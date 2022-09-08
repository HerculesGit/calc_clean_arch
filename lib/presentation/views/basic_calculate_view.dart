import 'package:calc_clean_arch/presentation/widgets/calculator_keyboard_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/calculator_display_widget.dart';

class BasicCalculateView extends StatelessWidget {
  const BasicCalculateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true, bottom: true, child: Scaffold(body: _buildBody(context)));
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(
                // color: Colors.red,
                height: constraints.maxHeight * .4,
                width: constraints.maxWidth,
                child: const CalculatorDisplayWidget()),
            SizedBox(
                // color: Colors.green,
                height: constraints.maxHeight * .6,
                width: constraints.maxWidth,
                child: const CalculatorKeyboardWidget()),
          ],
        );
      },
    );
  }
}
