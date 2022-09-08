import 'package:flutter/material.dart';

import '../../config/themes.dart';
import '../view_models/view_models.dart';

class CalculatorKeyboardWidget extends StatelessWidget {
  const CalculatorKeyboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => _buildKeyboard(context);

  Widget _buildKeyboard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: kDefaultMargin + 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        color: Color(0xFFEEEEEE),
      ),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        shrinkWrap: true,
        addAutomaticKeepAlives: false,
        childAspectRatio: 2 / 1.9,
        padding: const EdgeInsets.only(top: 32.0, bottom: kDefaultMargin),
        children: keyboards
            .map((keyboard) => _buildKeyboardButton(keyboard))
            .toList(),
      ),
    );
  }

  Widget _buildKeyboardButton(KeyboardViewModel keyboardViewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultMargin / 2),
      child: Text(
        keyboardViewModel.key,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: keyboardViewModel.lightColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
