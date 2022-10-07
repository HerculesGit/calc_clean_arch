import 'package:flutter/material.dart';

import '../../config/themes.dart';

class CalculatorDisplayWidget extends StatelessWidget {
  final String result;
  final String term;
  final bool animateResult;

  const CalculatorDisplayWidget({
    Key? key,
    required this.result,
    required this.term,
    required this.animateResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => _buildDisplay(context);

  Widget _buildDisplay(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeInOutSine;

    return Container(
      alignment: Alignment.bottomRight,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedDefaultTextStyle(
                duration: duration,
                curve: curve,
                style: animateResult
                    ? AppTheme.displayTermTextStyle
                    : AppTheme.displayResultTextStyle,
                child: Text(term),
              ),
              Padding(
                padding: const EdgeInsets.only(top: kDefaultMargin / 4),
                child: AnimatedDefaultTextStyle(
                  curve: curve,
                  duration: duration,
                  style: animateResult
                      ? AppTheme.displayResultTextStyle
                      : AppTheme.displayTermTextStyle,
                  child: Text(
                    '${result.isNotEmpty ? '=' : ''}$result',
                    style: animateResult
                        ? AppTheme.displayResultTextStyle
                        : AppTheme.displayTermTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
