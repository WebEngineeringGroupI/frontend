import 'package:flutter_app/main.dart';
import 'package:flutter_app/services/rest_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/config/constants.dart';

void main() {
  testWidgets('Home displays a title and a slogan',
      (WidgetTester tester) async {
    // Build app screen and capture the first frame
    await tester.pumpWidget(MyApp(restAPIClient: RestAPIClient()));

    // Verify that displays correct title and slogan.
    expect(find.text(Constants.APP_TITLE), findsOneWidget);
    expect(find.text(Constants.APP_SLOGAN), findsOneWidget);
  });
}
