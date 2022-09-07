import 'package:flutter/material.dart';

import '../../config/themes.dart';

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
                child: _buildDisplay(context)),
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

  Widget _buildKeyboard(BuildContext context) {
    return const SizedBox();
  }
}
