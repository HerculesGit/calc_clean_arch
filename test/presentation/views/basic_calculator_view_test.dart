import 'package:calc_clean_arch/inject.dart';
import 'package:calc_clean_arch/main.dart';
import 'package:calc_clean_arch/presentation/controllers/basic_calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget createWidgetForTest(Widget widget) => MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (context) => BasicCalculatorController(injector()),
    ),
  ],
  child: widget,
);

void main() {
  late Widget sut;
  setUp(() async {
    await initializeDependencies(testMode: true);
    sut = createWidgetForTest(const MyApp());
  });

  testWidgets('should initialize view displays with "=0" like a result',
          (tester) async {
        await tester.pumpWidget(sut);

        final initResultFinder = find.text('=0');
        expect(initResultFinder, findsOneWidget);
      });

  testWidgets('should calculate sum between 2+2 and returns a 4',
          (tester) async {
        await tester.pumpWidget(sut);
        final twoKeyFinder = find.text('2');
        final plusKeyFinder = find.text('+');

        await tester.tap(twoKeyFinder, warnIfMissed: false);
        await tester.tap(plusKeyFinder, warnIfMissed: false);
        await tester.tap(twoKeyFinder, warnIfMissed: false);
        await tester.pump();

        final resultFinder = find.text('=4');

        expect(resultFinder, findsOneWidget);
      });

  testWidgets('should clear when AC key is tapped', (tester) async {
    await tester.pumpWidget(sut);
    await tester.tap(find.text('2'), warnIfMissed: false);
    await tester.tap(find.text('2'), warnIfMissed: false);
    await tester.pump();

    await tester.tap(find.text('AC'), warnIfMissed: false);
    await tester.pump();

    final resultFinder = find.text('=0');
    expect(resultFinder, findsOneWidget);
  });

  testWidgets('should replace the first 0 number to a new tapped number',
          (tester) async {
        await tester.pumpWidget(sut);
        await tester.tap(find.text('2'), warnIfMissed: false);
        await tester.pump();

        final resultFinder = find.text('=2');
        expect(resultFinder, findsOneWidget);
      });

  testWidgets(
      'should display 0 and symbol tapped like a term when "=0" is the initial result',
          (tester) async {
        await tester.pumpWidget(sut);
        await tester.tap(find.text('+'), warnIfMissed: false);
        await tester.pump();

        final resultFinder = find.text('=0');
        expect(resultFinder, findsOneWidget);
      });

  testWidgets(
      'should display number and symbol tapped when 0 is the initial result',
          (tester) async {
        await tester.pumpWidget(sut);
        await tester.tap(find.text('2'), warnIfMissed: false);
        await tester.tap(find.text('+'), warnIfMissed: false);
        await tester.pump();

        Finder resultFinder = find.text('2+');
        expect(resultFinder, findsOneWidget);

        await tester.tap(find.text('AC'), warnIfMissed: false);
        await tester.pump();

        final numbers = ['1', '2', '3', '4'];
        for (var key in numbers) {
          await tester.tap(find.text(key), warnIfMissed: false);
        }
        await tester.tap(find.text('+'), warnIfMissed: false);
        await tester.pump();

        resultFinder = find.text('1234+');
        expect(resultFinder, findsOneWidget);
      });

  testWidgets('should replace the last symbol to the new symbol tapped',
          (tester) async {
        await tester.pumpWidget(sut);
        await tester.tap(find.text('1'), warnIfMissed: false);
        await tester.tap(find.text('+'), warnIfMissed: false);
        await tester.pump();

        Finder resultFinder = find.text('1+');
        expect(resultFinder, findsOneWidget);

        ///
        await tester.tap(find.text('-'), warnIfMissed: false);
        await tester.pump();

        expect(find.text('1-'), findsOneWidget);

        ///
        await tester.tap(find.text('x'), warnIfMissed: false);
        await tester.pump();
        expect(find.text('1x'), findsOneWidget);

        ///
        await tester.tap(find.text('AC'), warnIfMissed: false);
        await tester.pump();

        await tester.tap(find.text('1'), warnIfMissed: false);
        await tester.tap(find.text('2'), warnIfMissed: false);
        await tester.tap(find.text('+'), warnIfMissed: false);
        await tester.tap(find.text('3'), warnIfMissed: false);
        await tester.tap(find.text('-'), warnIfMissed: false);
        await tester.pump();
        expect(find.text('12+3-'), findsOneWidget);

        ///
        await tester.tap(find.text('-'), warnIfMissed: false);
        await tester.pump();
        expect(find.text('12+3-'), findsOneWidget);

        ///
        await tester.tap(find.text('+'), warnIfMissed: false);
        await tester.pump();
        expect(find.text('12+3+'), findsOneWidget);

        ///
        await tester.tap(find.text('1'), warnIfMissed: false);
        await tester.tap(find.text('+'), warnIfMissed: false);
        await tester.pump();
        expect(find.text('12+3+1+'), findsOneWidget);
      });
}
