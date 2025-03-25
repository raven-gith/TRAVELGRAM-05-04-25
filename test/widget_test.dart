import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ta_1/main.dart'; // Ganti dengan path yang benar

void main() {
  testWidgets('MyApp test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp()); // Tambahkan const jika MyApp menggunakan const
  });
}