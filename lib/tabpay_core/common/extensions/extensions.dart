import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

extension StringParsing on String {
  String toMoney() {
    return "$this ₮";
  }

  String toComma() {
    String number = replaceAll(",", "");
    if (number.length < 4) {
      return number;
    }
    var formatter = NumberFormat('###,###,###');
    return formatter.format(int.parse(number));
  }

  String toDate() {
    var dateFormatter = DateFormat("yyyy-MM-dd");
    var par = dateFormatter.parse(this);
    return par.toString().split(" ").first;
  }

  String toAccountNo(int length) {
    return replaceAllMapped(
        RegExp(r".{" "$length" "}"), (match) => "${match.group(0)} ");
  }

  String toPercent() {
    return "$this%";
  }

  String toRemoveChars() {
    return replaceAll('-', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(' ', '');
  }

  /// Zaigaar tusgaarlagdsan ugsiig tusd ni mask hiih. 1 useg + 1 od. Example: 12 > 1*, 123 > 1*3
  /// 
  /// Tusgai tohioldol 2oos urt usegtei ugend:
  /// 1. Swliin temdegtiig urgelj haruulna.
  /// 2. Tegsh urttai ugend swleesee 2 dahi temdegtiig nuuna. Example: 123456 > 1*3**6
  /// 3. '-' temdegtiig usgend tootsohgui mon urgelj haruulna. Example: 123-456 > 1*3-**6, 12-345-67 > 1*-3*5-*7
  String encryptByStar() {
    List<String> names = split(' ');
    String nameUI = '';

    for (int j = 0; j < names.length; j++) {
      var array = names[j].split('');
      bool indexChecker = true;
      int charaCounter = 0;
      for (int i = 0; i < array.length; i++) {
        // Ugiin urt ni 2 oos ih uguig shalgah
        if (array.length - charaCounter > 2) {
          //Swleesee 2 dahi temdegt deer irsen bol
          if (i == array.length - 2) {
            // Ugiin urt ni tegsh uguig shalgah
            if ((array.length - charaCounter) % 2 == 0) {
              indexChecker = false;
            }
          } else if (i == array.length - 1) {
            // Swliin temdegt urgelj haragdana
            if (i == array.length - 1) {
              indexChecker = true;
            }
          }
        }

        // - Temdegt orson bol haruulaad temdegtiin toog nemegdwleh
        if (array[i] == '-') {
          nameUI += array[i].toString();
          charaCounter += 1;
          continue;
        }

        // Temdegtiig haruulah uguig shalgah
        if (indexChecker) {
          nameUI += array[i].toString();
          indexChecker = !indexChecker;
        } else {
          nameUI += "*";
          indexChecker = !indexChecker;
        }
      }
      if (j + 1 < names.length) {
        nameUI += " ";
      }
    }
    return nameUI;
  }

  String splitBy4WithSpace() {
    var array = replaceAll(' ', '').split('');
    String result = '';

    for (int i = 0; i < array.length; i++) {
      result +=
          array[i].toString() + (i % 4 == 3 && i < array.length - 1 ? ' ' : '');
    }

    return result;
  }

  // ···
  String toLoanDate() {
    var dateTime = DateFormat("yyyy-MM-dd").parse(this);
    var formate1 =
        "${dateTime.year}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.day.toString().padLeft(2, '0')}";
    return formate1;
  }

  String toLoanDateTime() {
    var dateTime = DateFormat("yyyy-MM-dd  HH:mm:ss").parse(this);
    var formate1 =
        "${dateTime.year}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}-${dateTime.minute.toString().padLeft(2, '0')}";
    return formate1;
  }
}

extension DoubleParsing on double {
  String toMoney() {
    var formatter = NumberFormat('###,###,###');
    return "${formatter.format(toDouble())}₮";
  }

  String toComma() {
    String number = toString().replaceAll(",", "");
    var formatter = NumberFormat('###,###,###');
    return formatter.format(double.parse(number));
  }

  String toRound() {
    String number = round().toString().replaceAll(",", "");
    var formatter = NumberFormat('###,###,###');
    return formatter.format(int.parse(number));
  }
}

extension IntParsing on int {
  String toMoney() {
    var formatter = NumberFormat('###,###,###');
    return "${formatter.format(toInt())}₮";
  }

  String toLoanDate() {
    var format = DateFormat('yyyy.MM.dd');
    var date = DateTime.fromMillisecondsSinceEpoch(toInt());
    return format.format(date);
  }

  String toLoanDateTime() {
    var format = DateFormat('yyyy.MM.dd HH:mm');
    var date = DateTime.fromMillisecondsSinceEpoch(toInt());
    return format.format(date);
  }

  String toCouponDate() {
    var format = DateFormat('MM/dd/yyyy HH:mm');
    var date = DateTime.fromMillisecondsSinceEpoch(toInt());
    return format.format(date);
  }

  String toCouponDays() {
    var date = DateTime.fromMillisecondsSinceEpoch(toInt());
    var diff = date.difference(DateTime.now());
    return diff.inDays.toString();
  }

  String toComma() {
    String number = toString().replaceAll(",", "");
    var formatter = NumberFormat('###,###,###');
    return formatter.format(int.parse(number));
  }

  String toRound() {
    String number = round().toString().replaceAll(",", "");
    var formatter = NumberFormat('###,###,###');
    return formatter.format(int.parse(number));
  }
}

///
/// An implementation of [NumberInputFormatter] automatically inserts thousands
/// separators to numeric input. For example, a input of `1234` should be
/// formatted to `1,234`.
///
class ThousandsFormatter extends NumberInputFormatter {
  static final NumberFormat _formatter = NumberFormat.decimalPattern();

  final FilteringTextInputFormatter _decimalFormatter;
  final String _decimalSeparator;
  final RegExp _decimalRegex;

  final NumberFormat? formatter;
  final bool allowFraction;

  ThousandsFormatter({this.formatter, this.allowFraction = false})
      : _decimalSeparator = (formatter ?? _formatter).symbols.DECIMAL_SEP,
        _decimalRegex = RegExp(allowFraction
            ? '[0-9]+([${(formatter ?? _formatter).symbols.DECIMAL_SEP}])?'
            : r'\d+'),
        _decimalFormatter = FilteringTextInputFormatter.allow(RegExp(
            allowFraction
                ? '[0-9]+([${(formatter ?? _formatter).symbols.DECIMAL_SEP}])?'
                : r'\d+'));

  @override
  String _formatPattern(String? digits) {
    if (digits == null || digits.isEmpty) return '';
    num number;
    if (allowFraction) {
      String decimalDigits = digits;
      if (_decimalSeparator != '.') {
        decimalDigits = digits.replaceFirst(RegExp(_decimalSeparator), '.');
      }
      number = double.tryParse(decimalDigits) ?? 0.0;
    } else {
      number = int.tryParse(digits) ?? 0;
    }
    final result = (formatter ?? _formatter).format(number);
    if (allowFraction && digits.endsWith(_decimalSeparator)) {
      return '$result$_decimalSeparator';
    }
    return result;
  }

  @override
  TextEditingValue _formatValue(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return _decimalFormatter.formatEditUpdate(oldValue, newValue);
  }

  @override
  bool _isUserInput(String s) {
    return s == _decimalSeparator || _decimalRegex.firstMatch(s) != null;
  }
}

///
/// An implementation of [NumberInputFormatter] that converts a numeric input
/// to credit card number form (4-digit grouping). For example, a input of
/// `12345678` should be formatted to `1234 5678`.
///
class CreditCardFormatter extends NumberInputFormatter {
  static final RegExp _digitOnlyRegex = RegExp(r'\d+');
  static final FilteringTextInputFormatter _digitOnlyFormatter =
      FilteringTextInputFormatter.allow(_digitOnlyRegex);

  final String separator;

  CreditCardFormatter({this.separator = ' '});

  @override
  String _formatPattern(String digits) {
    StringBuffer buffer = StringBuffer();
    int offset = 0;
    int count = min(4, digits.length);
    final length = digits.length;
    for (; count <= length; count += min(4, max(1, length - count))) {
      buffer.write(digits.substring(offset, count));
      if (count < length) {
        buffer.write(separator);
      }
      offset = count;
    }
    return buffer.toString();
  }

  @override
  TextEditingValue _formatValue(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return _digitOnlyFormatter.formatEditUpdate(oldValue, newValue);
  }

  @override
  bool _isUserInput(String s) {
    return _digitOnlyRegex.firstMatch(s) != null;
  }
}

///
/// An abstract class extends from [TextInputFormatter] and does numeric filter.
/// It has an abstract method `_format()` that lets its children override it to
/// format input displayed on [TextField]
///
abstract class NumberInputFormatter extends TextInputFormatter {
  TextEditingValue? _lastNewValue;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    /// nothing changes, nothing to do
    if (newValue.text == _lastNewValue?.text) {
      return newValue;
    }
    _lastNewValue = newValue;

    /// remove all invalid characters
    newValue = _formatValue(oldValue, newValue);

    /// current selection
    int selectionIndex = newValue.selection.end;

    /// format original string, this step would add some separator
    /// characters to original string
    final newText = _formatPattern(newValue.text);

    /// count number of inserted character in new string
    int insertCount = 0;

    /// count number of original input character in new string
    int inputCount = 0;
    for (int i = 0; i < newText.length && inputCount < selectionIndex; i++) {
      final character = newText[i];
      if (_isUserInput(character)) {
        inputCount++;
      } else {
        insertCount++;
      }
    }

    /// adjust selection according to number of inserted characters staying before
    /// selection
    selectionIndex += insertCount;
    selectionIndex = min(selectionIndex, newText.length);

    /// if selection is right after an inserted character, it should be moved
    /// backward, this adjustment prevents an issue that user cannot delete
    /// characters when cursor stands right after inserted characters
    if (selectionIndex - 1 >= 0 &&
        selectionIndex - 1 < newText.length &&
        !_isUserInput(newText[selectionIndex - 1])) {
      selectionIndex--;
    }

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: selectionIndex),
        composing: TextRange.empty);
  }

  /// check character from user input or being inserted by pattern formatter
  bool _isUserInput(String s);

  /// format user input with pattern formatter
  String _formatPattern(String digits);

  /// validate user input
  TextEditingValue _formatValue(
      TextEditingValue oldValue, TextEditingValue newValue);
}

String getFontUri(ByteData data, String mime) {
  final buffer = data.buffer;
  return Uri.dataFromBytes(
          buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
          mimeType: mime)
      .toString();
}

Future<String> addFontToHtml(String htmlContent, String fontAssetPath,
    String fontMime, String color, bool justif) async {
  final fontData = await rootBundle.load(fontAssetPath);
  final fontUri = getFontUri(fontData, fontMime).toString();
  const textJustif = 'text-align: justify; text-justify: inter-word;';
  final fontCss =
      '@font-face { font-family: customFont; src: url($fontUri); } * { font-family: customFont; font-size: 13px !important; color: $color; ${justif ? textJustif : ' '} }';
  return '<header><meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"></header><style>$fontCss</style>$htmlContent';
}

Future<String> convertString(String body, String color, bool justif) async {
  String completeHtml = await addFontToHtml(body,
      "assets/fonts/CodeNextSemiBold.otf", "font/opentype", color, justif);
  String htmlUri = Uri.dataFromString(completeHtml,
          mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
      .toString();
  return htmlUri;
}
