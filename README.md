# flutter_drop_cap_text

[![pub package](https://img.shields.io/pub/v/flutter_drop_cap_text.svg?style=flat-square)](https://pub.dev/packages/flutter_drop_cap_text)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg?style=flat-square)](https://pub.dev/packages/very_good_analysis)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

A Flutter package for creating beautiful [drop cap](https://en.wikipedia.org/wiki/Initial#Types_of_initial) text effects in your Flutter applications.

## Features

- 🎨 **Multiple Drop Cap Modes**: Support for inside, upwards, aside, and baseline modes
- 🖼️ **Custom Drop Cap Widgets**: Use images or custom widgets as drop caps
- 📝 **Inline Markdown Parsing**: Support for bold, italic, and underline formatting
- 🎯 **Flexible Positioning**: Position drop cap at start or end of text
- 🎨 **Customizable Styling**: Full control over drop cap and text styling
- 📐 **Indentation & Padding**: Fine-tune spacing and positioning
- 🔤 **Multiple Characters**: Support for multi-character drop caps

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_drop_cap_text: ^0.1.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_drop_cap_text/drop_cap_text.dart';

DropCapText(
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
  style: TextStyle(fontStyle: FontStyle.italic),
),
```

![ex1](https://i.ibb.co/wQMn1z3/ex1.png)

### Custom Drop Cap Widget: Image

```dart
DropCapText(
  loremIpsumText,
  dropCap: DropCap(
    width: 100,
    height: 100,
    child: Image.network(
      'https://www.codemate.com/wp-content/uploads/2017/09/flutter-logo.png'
    ),
  ),
),
```

![ex3](https://i.ibb.co/D43w1H8/ex3.png)

### Parse Inline Markdown

Supports `_italic_`, `**bold**`, and `++underline++` formatting.

```dart
DropCapText(
  'Lorem ipsum **dolor sit amet, consectetur adipiscing elit, ++sed do eiusmod++ tempor incididunt** ut labore et _dolore magna aliqua_.',
  parseInlineMarkdown: true,
  dropCapStyle: TextStyle(
    fontSize: 100,
    fontWeight: FontWeight.bold,
    color: Colors.green,
  ),
  dropCapPadding: EdgeInsets.only(right: 19.0),
  style: TextStyle(fontSize: 18.0, height: 1.5),
),
```

![ex8](https://i.ibb.co/tJsvbFt/dropcap-md2.jpg)

### Image Right + Justification

```dart
DropCapText(
  loremIpsumText,
  dropCapPosition: DropCapPosition.end,
  textAlign: TextAlign.justify,
  dropCap: DropCap(
    width: 100,
    height: 100,
    child: Image.network(
      'https://www.codemate.com/wp-content/uploads/2017/09/flutter-logo.png'
    ),
  ),
),
```

![ex7](https://i.ibb.co/WVPT3HH/img-end.jpg)

### Multiple Characters + Indentation

```dart
DropCapText(
  loremIpsumText,
  style: TextStyle(
    height: 1.3,
    fontFamily: 'times',
  ),
  dropCapChars: 2,
  indentation: Offset(25, 10),
),
```

![ex2](https://i.ibb.co/yq1Vj7q/ex2.png)

### Upward Drop Cap

```dart
DropCapText(
  loremIpsumText,
  mode: DropCapMode.upwards,
  dropCapStyle: TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 120,
    fontFamily: 'times',
  ),
),
```

![ex5](https://i.ibb.co/b3M6KD8/ex5.png)

### Aside Drop Cap

```dart
DropCapText(
  loremIpsumText,
  style: TextStyle(
    fontWeight: FontWeight.bold,
    height: 1.2,
  ),
  mode: DropCapMode.aside,
),
```

![ex6](https://i.ibb.co/bFmrM6G/ex6.png)

## API Reference

### DropCapText

A widget that displays text with a drop cap effect.

#### Parameters

- `data` (required): The text string to display
- `mode` (default: `DropCapMode.inside`): Drop cap display mode (inside, upwards, aside, baseline)
- `textAlign` (default: `TextAlign.start`): Text alignment
- `indentation` (default: `Offset.zero`): Indentation offset for the drop cap
- `dropCapChars` (default: `1`): Number of characters to use for the drop cap
- `dropCapPadding` (default: `EdgeInsets.zero`): Padding around the drop cap
- `dropCap` (default: `null`): Custom drop cap widget (e.g., image)
- `style` (default: `null`): TextStyle for the main text
- `dropCapStyle` (default: `null`): TextStyle for the drop cap
- `forceNoDescent` (default: `false`): Force no descent for the drop cap
- `parseInlineMarkdown` (default: `false`): Enable inline markdown parsing (bold, italic, underline)
- `dropCapPosition` (default: `DropCapPosition.start`): Position of the drop cap (start or end)
- `textDirection` (default: `TextDirection.ltr`): Text direction
- `maxLines` (default: `null`): Maximum number of lines
- `overflow` (default: `TextOverflow.clip`): Text overflow behavior

### DropCapMode

Enum defining the drop cap display modes:

- `inside`: Default mode, drop cap is inside the text flow
- `upwards`: Drop cap extends upward
- `aside`: Drop cap is positioned aside the text
- `baseline`: Drop cap aligns with baseline (limited customization support)

### DropCapPosition

Enum defining the drop cap position:

- `start`: Drop cap at the beginning of text
- `end`: Drop cap at the end of text

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
