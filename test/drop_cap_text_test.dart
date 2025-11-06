import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drop_cap_text/drop_cap_text.dart';

void main() {
  group('DropCapText', () {
    testWidgets('creates a DropCapText widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropCapText(
              'Lorem ipsum dolor sit amet',
            ),
          ),
        ),
      );
      expect(find.byType(DropCapText), findsOneWidget);
    });

    testWidgets('displays text with drop cap', (WidgetTester tester) async {
      const String testText = 'Lorem ipsum dolor sit amet';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropCapText(testText),
          ),
        ),
      );
      expect(find.text(testText.substring(1)), findsWidgets);
    });

    testWidgets('uses default values', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropCapText('Test text'),
          ),
        ),
      );
      final DropCapText widget = tester.widget(find.byType(DropCapText));
      expect(widget.mode, equals(DropCapMode.inside));
      expect(widget.dropCapChars, equals(1));
      expect(widget.textAlign, equals(TextAlign.start));
      expect(widget.indentation, equals(Offset.zero));
      expect(widget.dropCapPadding, equals(EdgeInsets.zero));
      expect(widget.forceNoDescent, isFalse);
      expect(widget.parseInlineMarkdown, isFalse);
      expect(widget.textDirection, equals(TextDirection.ltr));
      expect(widget.overflow, equals(TextOverflow.clip));
    });

    testWidgets('uses custom values', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropCapText(
              'Test text',
              mode: DropCapMode.upwards,
              dropCapChars: 2,
              textAlign: TextAlign.justify,
              indentation: const Offset(10, 5),
              dropCapPadding: const EdgeInsets.all(8),
              forceNoDescent: true,
              parseInlineMarkdown: true,
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.ellipsis,
              dropCapPosition: DropCapPosition.end,
            ),
          ),
        ),
      );
      final DropCapText widget = tester.widget(find.byType(DropCapText));
      expect(widget.mode, equals(DropCapMode.upwards));
      expect(widget.dropCapChars, equals(2));
      expect(widget.textAlign, equals(TextAlign.justify));
      expect(widget.indentation, equals(const Offset(10, 5)));
      expect(widget.dropCapPadding, equals(const EdgeInsets.all(8)));
      expect(widget.forceNoDescent, isTrue);
      expect(widget.parseInlineMarkdown, isTrue);
      expect(widget.textDirection, equals(TextDirection.rtl));
      expect(widget.overflow, equals(TextOverflow.ellipsis));
      expect(widget.dropCapPosition, equals(DropCapPosition.end));
    });

    testWidgets('handles empty string', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropCapText(''),
          ),
        ),
      );
      expect(find.byType(DropCapText), findsOneWidget);
    });

    testWidgets('handles custom drop cap widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropCapText(
              'Test text',
              dropCap: DropCap(
                width: 50,
                height: 50,
                child: Container(color: Colors.red),
              ),
            ),
          ),
        ),
      );
      expect(find.byType(DropCapText), findsOneWidget);
      expect(find.byType(DropCap), findsOneWidget);
    });

    testWidgets('handles baseline mode', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropCapText(
              'Test text',
              mode: DropCapMode.baseline,
            ),
          ),
        ),
      );
      final DropCapText widget = tester.widget(find.byType(DropCapText));
      expect(widget.mode, equals(DropCapMode.baseline));
    });

    testWidgets('handles aside mode', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropCapText(
              'Test text',
              mode: DropCapMode.aside,
            ),
          ),
        ),
      );
      final DropCapText widget = tester.widget(find.byType(DropCapText));
      expect(widget.mode, equals(DropCapMode.aside));
    });
  });

  group('DropCap', () {
    testWidgets('creates a DropCap widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropCap(
              width: 100,
              height: 100,
              child: Container(),
            ),
          ),
        ),
      );
      expect(find.byType(DropCap), findsOneWidget);
    });

    testWidgets('uses correct dimensions', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropCap(
              width: 50,
              height: 75,
              child: Container(),
            ),
          ),
        ),
      );
      final DropCap widget = tester.widget(find.byType(DropCap));
      expect(widget.width, equals(50));
      expect(widget.height, equals(75));
    });
  });
}
