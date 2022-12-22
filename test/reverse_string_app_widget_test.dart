import 'package:flutter/material.dart';
import 'package:flutter_academy_ar/reverse_string_app/reverse_string_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('Reverse string widget test', (WidgetTester widgetTester) async{

    await widgetTester.pumpWidget(ReverseStringApp());
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);

    await widgetTester.enterText(textField, 'HHHello');
    expect(find.text('HHHello'), findsOneWidget);

    var button = find.text('Reverse');
    expect(button, findsOneWidget);

    await widgetTester.tap(button);
    await widgetTester.pump();

    expect(find.text('olleHHH'), findsOneWidget);
  });
}