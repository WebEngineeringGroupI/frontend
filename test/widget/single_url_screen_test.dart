import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/services/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/screens/single_url.dart';

Widget buildTestableWidget(Widget widget) {
  // https://docs.flutter.io/flutter/widgets/MediaQuery-class.html
  return new MediaQuery(
      data: new MediaQueryData(), child: new MaterialApp(home: widget));
}

void main() {
  testWidgets('Single url screen displays input box and short button',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(restAPIClient: APIClient()));

    expect(find.byKey(singleUrlShortButton), findsOneWidget);
    expect(find.byKey(singleUrlInputKey), findsOneWidget);
  });

  /*testWidgets('When the short button is pushed, the input box disappears',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(restAPIClient: APIClient()));

    await tester.tap(find.text(Constants.SHORT_BUTTON));
    await tester.pump();

    expect(find.byKey(singleUrlShortButton), findsNothing);
    expect(find.byKey(singleUrlInputKey), findsNothing);
  });

  testWidgets("When the short button is pushed, there's a short URL in the box",
      (WidgetTester tester) async {
    var client = FakeRestAPIClient();
    client.shortURLExpected = "https://aShortURL.com";

    await tester.pumpWidget(MyApp(restAPIClient: client));

    var shortButton = find.byKey(singleUrlShortButton);
    expect(shortButton, findsOneWidget);

    await tester.tap(shortButton);
    await tester.pump();

    expect(find.byKey(singleUrlShortenedBox), findsOneWidget);
    expect(find.text("https://aShortURL.com"), findsOneWidget);
  });*/
}
