import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/main.dart'; 

void main() {
  testWidgets('ReCart app loads login screen smoke test', (WidgetTester tester) async {
    // بناء التطبيق وتشغيله
    await tester.pumpWidget(const ReCartApp());

    // التحقق من ظهور عناصر شاشة تسجيل الدخول
    expect(find.text('ReCart'), findsOneWidget);
    expect(find.text('تسجيل الدخول'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
  });
}
