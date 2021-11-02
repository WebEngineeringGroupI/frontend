import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/screens/single_url.dart';
import 'package:flutter_app/config/constants.dart';

void main() {
  testWidgets('Single url screen displays input box and short button', (WidgetTester tester)
  async {
    // Build app screen and capture the first frame
    await tester.pumpWidget(MyApp());


    expect(find.text(Constants.SHORT_BUTTON), findsOneWidget);
    expect(find.byKey(singleUrlInputKey), findsOneWidget);
  });

  testWidgets('When the short button is pushed, the input box disappears', (WidgetTester tester)
  async {

    await tester.pumpWidget(MyApp());
    await tester.tap(find.text(Constants.SHORT_BUTTON));
    await tester.pump();

    expect(find.text(Constants.SHORT_BUTTON), findsNothing);
    expect(find.byKey(singleUrlInputKey), findsNothing);
  });
}
