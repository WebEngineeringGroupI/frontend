import 'package:flutter_app/main.dart';
import 'package:flutter_app/screens/csv.dart';
import 'package:flutter_app/services/rest_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/config/constants.dart';

void main() {
  testWidgets('When csv tab is pushed, there is an info text',
          (WidgetTester tester) async {
        // Build app screen and capture the first frame
        await tester.pumpWidget(MyApp(restAPIClient: RestAPIClient()));

        var csvTab = find.text(Constants.CSV_TAB);
        expect(csvTab, findsOneWidget);

        await tester.tap(csvTab);
        await tester.pumpAndSettle();

        expect(find.text(Constants.CSV_INFO), findsOneWidget);
      });

  testWidgets('When csv tab is pushed, there is an "Add csv file" button',
          (WidgetTester tester) async {
        // Build app screen and capture the first frame
        await tester.pumpWidget(MyApp(restAPIClient: RestAPIClient()));

        var csvTab = find.text(Constants.CSV_TAB);
        expect(csvTab, findsOneWidget);

        await tester.tap(csvTab);
        await tester.pumpAndSettle();

        var csvButton = find.byKey(csvButtonKey);
        expect(csvButton, findsOneWidget);
      });
}