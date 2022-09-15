import 'package:calc_clean_arch/config/routes/routes_contants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/themes.dart';
import '../controllers/app_theme_controller.dart';

class CalculatorDisplayWidget extends StatelessWidget {
  final String result;
  final String term;

  const CalculatorDisplayWidget(
      {Key? key, required this.result, required this.term})
      : super(key: key);

  @override
  Widget build(BuildContext context) => _buildDisplay(context);

  Widget _buildDisplay(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultMargin,
        vertical: kDefaultMargin + kDefaultMargin / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              const Spacer(),
              Expanded(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  _buildChangeThemeButton(context),
                ]),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildHistoryButton(context),
                ],
              )),
            ],
          ),
          const Spacer(),
          Text(term, style: TextStyle(fontSize: 20, color: AppTheme.textColor)),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultMargin / 4),
            child: Text(
              '${result.isNotEmpty ? '=' : ''}$result',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45.0,
                color: AppTheme.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChangeThemeButton(BuildContext context) {
    final appTheme = Provider.of<AppThemeController>(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultMargin, vertical: kDefaultMargin / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppTheme.backgroundCardColor,
      ),
      child: Row(
        children: [
          _buildButton(
            context,
            icon: Icons.sunny,
            enabled: appTheme.isDark == false,
            onTouch: () {
              appTheme.isDark = false;
            },
          ),
          const SizedBox(width: kDefaultMargin),
          _buildButton(
            enabled: appTheme.isDark == true,
            context,
            icon: Icons.nightlight_outlined,
            onTouch: () {
              appTheme.isDark = true;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultMargin, vertical: kDefaultMargin / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppTheme.backgroundCardColor,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _goToHistory(context),
            child: Icon(Icons.history, color: AppTheme.enabledAccentColor),
          )
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required IconData icon,
      required bool enabled,
      required Function onTouch}) {
    return GestureDetector(
      onTap: () => onTouch(),
      child: AbsorbPointer(
        child: Icon(icon,
            color: enabled
                ? AppTheme.enabledAccentColor
                : AppTheme.disabledAccentColor),
      ),
    );
  }

  _goToHistory(BuildContext context) =>
      Navigator.pushNamed(context, kBasicHistoryCalculateView);
}
