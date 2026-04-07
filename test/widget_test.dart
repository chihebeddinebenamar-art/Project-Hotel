import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_hotel/main.dart';

void main() {
  testWidgets('App démarre sur la page d’introduction', (WidgetTester tester) async {
    await tester.pumpWidget(const HotelApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
