// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:input_flutter_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    //Testing Form field and button
    await tester.enterText(find.byKey(Key("formdata")), "Fedya");
    await tester.enterText(find.byKey(Key("emailFormData")), "fedya@gmail.com");
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text("Form load is success"), findsOneWidget);
  });
}
