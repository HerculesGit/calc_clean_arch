import 'package:calc_clean_arch/config/themes.dart';
import 'package:calc_clean_arch/presentation/controllers/basic_history_calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryCalculateView extends StatefulWidget {
  const HistoryCalculateView({Key? key}) : super(key: key);

  @override
  State<HistoryCalculateView> createState() => _HistoryCalculateViewState();
}

class _HistoryCalculateViewState extends State<HistoryCalculateView> {
  BasicHistoryCalculatorController? calculatorController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    calculatorController =
        Provider.of<BasicHistoryCalculatorController>(context);
    if (calculatorController != null) calculatorController?.loadHistoryData();
  }

  @override
  void dispose() {
    super.dispose();
    calculatorController?.initData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              foregroundColor: AppTheme.enabledAccentColor,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title:
                  Text('History', style: TextStyle(color: AppTheme.textColor)),
            ),
            backgroundColor: AppTheme.backgroundColor,
            body: _buildBody(context)));
  }

  Widget _buildBody(BuildContext context) {
    return Consumer<BasicHistoryCalculatorController>(
      builder: (context, controller, child) => ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: controller.histories.length,
        itemBuilder: (context, index) => _historyItem(
          context,
          controller.histories[index].value,
        ),
      ),
    );
  }

  Widget _historyItem(final BuildContext context, final String term) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(term, style: TextStyle(color: AppTheme.textColor)));
}
