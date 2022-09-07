import 'package:flutter/material.dart';

import '../../config/themes.dart';
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
        print(constraints);

        return Column(
          children: [
            SizedBox(
                // color: Colors.red,
                height: constraints.maxHeight * .4,
                width: constraints.maxWidth,
                child: const CalculatorDisplayWidget()),
            Container(
                color: Colors.green,
                height: constraints.maxHeight * .6,
                width: constraints.maxWidth,
                child: _buildKeyboard(context)),
          ],
        );
      },
    );
  }

  Widget _buildKeyboard(BuildContext context) {
    return const SizedBox();
  }
}
