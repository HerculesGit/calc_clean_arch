import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/routes/routes_contants.dart';
import '../../config/themes.dart';
import '../controllers/app_theme_controller.dart';

class ChangeCalculatorThemeButton extends StatelessWidget {
  const ChangeCalculatorThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultMargin / 2),
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            key: const Key('sunny'),
            context,
            icon: Icons.sunny,
            enabled: appTheme.isDark == false,
            onTouch: () {
              appTheme.isDark = false;
            },
          ),
          const SizedBox(width: kDefaultMargin),
          _buildButton(
            key: const Key('nightlight_outlined'),
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
      required Key key,
      required bool enabled,
      required Function onTouch}) {
    return GestureDetector(
      key: key,
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
