import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_riverpod_countries/features/settings/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeNotifier', () {
   late ThemeNotifier notifier;

   setUp(() async {
     SharedPreferences.setMockInitialValues({});
     notifier = ThemeNotifier();
     await Future.delayed(const Duration(milliseconds: 100));
   });

   test('toggle changes state to true', () {
    notifier.toggle(true);
    expect(notifier.state, isTrue);
   });

   test('toggle changes state back to false', () {
     notifier.toggle(true);
     expect(notifier.state, isTrue);

     notifier.toggle(false);
     expect(notifier.state, isFalse);
   });


  });
}