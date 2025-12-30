// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:hoorfi/main.dart';
import 'package:hoorfi/providers/progress_provider.dart';
import 'package:hoorfi/providers/audio_provider.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app with providers
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProgressProvider()),
          ChangeNotifierProvider(create: (_) => AudioProvider()),
        ],
        child: const ArabicLearningApp(),
      ),
    );

    // Wait for async operations
    await tester.pumpAndSettle();

    // Verify that app name appears
    expect(find.text('حروفي'), findsOneWidget);
  });
}
