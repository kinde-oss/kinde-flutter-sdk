import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/navigation/router.dart';
import 'package:flutter_starter_kit/screens/routes.dart';
import 'package:flutter_starter_kit/screens/unknown/unknown_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GoRouter router;

  setUp(() => router = createRouter());
  tearDown(() => router.dispose());

  test('existing routes remain case-insensitive after go_router upgrade', () {
    for (final path in [AppRoutes.HOME, AppRoutes.SPLASH, AppRoutes.WELCOME]) {
      final original = router.configuration.findMatch(Uri.parse(path));
      final uppercase = router.configuration.findMatch(
        Uri.parse(path.toUpperCase()),
      );
      expect(original.isError, isFalse);
      expect(uppercase.isError, isFalse);
      expect(uppercase.matches.last.route, original.matches.last.route);
    }
  });

  test('deep-link query parameters and fragments remain intact', () {
    final uri = Uri.parse('/WELCOME?invitation_code=test-invite#section');
    final match = router.configuration.findMatch(uri);
    expect(match.isError, isFalse);
    expect(match.uri.queryParameters['invitation_code'], 'test-invite');
    expect(match.uri.fragment, 'section');
    expect(
      match.matches.last.route,
      router.configuration
          .findMatch(Uri.parse(AppRoutes.WELCOME))
          .matches
          .last
          .route,
    );
  });

  test('unknown paths still use the configured error route', () {
    final unknown = router.configuration.findMatch(Uri.parse('/not-a-route'));
    expect(unknown.isError, isTrue);
    final known = router.configuration.findMatch(Uri.parse(AppRoutes.WELCOME));
    expect(known.isError, isFalse);
  });

  testWidgets('unknown paths still render the existing 404 screen', (
    tester,
  ) async {
    router.go('/not-a-route');
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();
    expect(find.byType(UnknownScreen), findsOneWidget);
    expect(find.text('404 - Page not found'), findsOneWidget);
  });
}
