import 'package:flutter/material.dart';

import '../../config/themes.dart';

class CalculatorDisplayWidget extends StatelessWidget {
  const CalculatorDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => _buildDisplay(context);

  Widget _buildDisplay(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultMargin,
        vertical: kDefaultMargin + kDefaultMargin / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_buildChangeThemeButton()]),
          const Spacer(),
          const Text('308x42', style: TextStyle(fontSize: 20)),
          const Padding(
            padding: EdgeInsets.only(top: kDefaultMargin / 4),
            child: Text(
              '12,936',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChangeThemeButton() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultMargin, vertical: kDefaultMargin / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFDFDEDE),
      ),
      child: Row(
        children: const [
          Icon(Icons.sunny),
          SizedBox(width: kDefaultMargin),
          Icon(Icons.nightlight_outlined, color: Color(0xFFBDBEC0)),
        ],
      ),
    );
  }
}
