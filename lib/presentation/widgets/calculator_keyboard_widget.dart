import 'package:flutter/material.dart';

import '../../config/themes.dart';
import '../view_models/view_models.dart';

class CalculatorKeyboardWidget extends StatelessWidget {
  final Function(KeyboardViewModel key) onButtonTapped;

  const CalculatorKeyboardWidget({Key? key, required this.onButtonTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(bottom: kDefaultMargin + 20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            color: AppTheme.backgroundCardColor),
        child: Column(children: _buildCustomGridView()),
      );

  List<Widget> _buildCustomGridView() {
    const crossAxisCount = 4;
    final List<Widget> crossAxisChildren = [];
    final List<Widget> mainAxisChildren = [];

    for (var keyboard in keyboards) {
      if (crossAxisChildren.length == crossAxisCount) {
        mainAxisChildren
            .add(Expanded(child: Row(children: List.from(crossAxisChildren))));
        crossAxisChildren.clear();
      }
      crossAxisChildren.add(_buildKeyboardButton(keyboard));
    }

    mainAxisChildren
        .add(Expanded(child: Row(children: List.from(crossAxisChildren))));

    return mainAxisChildren;
  }

  Widget _buildKeyboardButton(KeyboardViewModel keyboardViewModel) {
    return Expanded(
      child: GestureDetector(
        onTap: () => keyboardViewModel.enabled
            ? onButtonTapped(keyboardViewModel)
            : () {},
        child: AbsorbPointer(
          absorbing: true,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(4.0),
            // color: Colors.red,
            child: Text(
              keyboardViewModel.key,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.isDark
                    ? keyboardViewModel.darkColor
                    : keyboardViewModel.lightColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
