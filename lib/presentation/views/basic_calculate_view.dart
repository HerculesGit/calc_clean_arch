import 'package:calc_clean_arch/presentation/controllers/app_theme_controller.dart';
import 'package:calc_clean_arch/presentation/controllers/basic_calculator_controller.dart';
import 'package:calc_clean_arch/presentation/widgets/calculator_keyboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/themes.dart';
import '../widgets/calculator_display_widget.dart';

class BasicCalculateView extends StatelessWidget {
  const BasicCalculateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        child: Consumer<AppThemeController>(
          builder: (context, value, child) => Scaffold(
              backgroundColor: AppTheme.backgroundColor,
              body: _buildBody(context)),
        ));
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Consumer<BasicCalculatorController>(
            builder: (context, controller, child) {
          print('basicCalculator.result ${controller.result}');
          print('basicCalculator.inputTerm ${controller.inputTerm}');
          return Column(
            children: [
              SizedBox(
                  // color: Colors.red,
                  height: constraints.maxHeight * .4,
                  width: constraints.maxWidth,
                  child: CalculatorDisplayWidget(
                    animateResult: controller.animateResult,
                    term: controller.inputTerm,
                    result: controller.result,
                  )),
              SizedBox(
                // color: Colors.green,
                height: constraints.maxHeight * .6,
                width: constraints.maxWidth,
                child: CalculatorKeyboardWidget(
                  onButtonTapped: (key) => controller.didKeyPressed(key),
                ),
              ),
            ],
          );
        });
      },
    );
  }
}
