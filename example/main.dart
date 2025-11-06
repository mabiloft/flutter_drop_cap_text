import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';

const String loremIpsumText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const DropCapText(loremIpsumText, style: TextStyle(fontStyle: FontStyle.italic)),
                const SizedBox(height: 30),
                DropCapText(
                  loremIpsumText,
                  dropCap: DropCap(
                    width: 100,
                    height: 100,
                    child: Image.network('https://www.codemate.com/wp-content/uploads/2017/09/flutter-logo.png'),
                  ),
                ),
                const SizedBox(height: 30),
                const DropCapText(
                  'Lorem ipsum **dolor sit amet, consectetur adipiscing elit, ++sed do eiusmod++ tempor incididunt** ut labore et _dolore magna aliqua_.',
                  parseInlineMarkdown: true,
                  dropCapStyle: TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.green),
                  dropCapPadding: EdgeInsets.only(right: 19),
                  style: TextStyle(fontSize: 18, height: 1.5),
                ),
                const SizedBox(height: 30),
                DropCapText(
                  loremIpsumText,
                  dropCapPosition: DropCapPosition.end,
                  textAlign: TextAlign.justify,
                  dropCap: DropCap(
                    width: 100,
                    height: 100,
                    child: Image.network('https://www.codemate.com/wp-content/uploads/2017/09/flutter-logo.png'),
                  ),
                ),
                const SizedBox(height: 30),
                const DropCapText(
                  loremIpsumText,
                  style: TextStyle(height: 1.3, fontFamily: 'times'),
                  dropCapChars: 2,
                  indentation: Offset(25, 10),
                ),
                const SizedBox(height: 30),
                const DropCapText(
                  loremIpsumText,
                  mode: DropCapMode.upwards,
                  dropCapStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 120,
                    fontFamily: 'times',
                  ),
                ),
                const SizedBox(height: 30),
                const DropCapText(
                  loremIpsumText,
                  style: TextStyle(fontWeight: FontWeight.bold, height: 1.2),
                  mode: DropCapMode.aside,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
