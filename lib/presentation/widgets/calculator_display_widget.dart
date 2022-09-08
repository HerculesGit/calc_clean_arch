import 'package:flutter/material.dart';

import '../../config/themes.dart';

class CalculatorDisplayWidget extends StatelessWidget {
  final String result;
  final String term;

  const CalculatorDisplayWidget(
      {Key? key, required this.result, required this.term})
      : super(key: key);

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
          Text(term, style: const TextStyle(fontSize: 20)),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultMargin / 4),
            child: Text(
              '${result.isNotEmpty ? '=' : ''}$result',
              style: const TextStyle(
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
