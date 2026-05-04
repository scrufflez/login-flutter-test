import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:login_flutter_test/main.dart';

void main() {
  testWidgets('Login screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const LoginApp());
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Login'), findsOneWidget);
  });
}
