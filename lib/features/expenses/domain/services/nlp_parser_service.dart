import 'package:intl/intl.dart';

// A simple structure to hold the parsing result
class ParsedExpenseData {
  final double? amount;
  final String? categoryId;
  final DateTime? date;

  ParsedExpenseData({this.amount, this.categoryId, this.date});
}

class NlpParserService {
  // --- 1. Define Category Keywords ---
  // This is the core of our engine. We must map Yemeni dialect keywords
  // to our internal category IDs.
  static const Map<String, String> _categoryKeywords = {
    // Category ID: 'groceries'
    'بقالة': 'groceries',
    'سوبرماركت': 'groceries',
    // Category ID: 'fuel'
    'بترول': 'fuel',
    'بنزين': 'fuel',
    'محطة': 'fuel',
    'ديزل': 'fuel',
    // Category ID: 'food'
    'فطور': 'food',
    'غداء': 'food',
    'عشاء': 'food',
    'مطعم': 'food',
    // Category ID: 'transport'
    'مواصلات': 'transport',
    'باص': 'transport',
    // Add more keywords for all default categories...
  };

  // --- 2. Main Parsing Function ---
  ParsedExpenseData parse(String input) {
    // Normalize input for easier parsing
    final normalizedInput = _normalizeText(input);

    final double? amount = _extractAmount(normalizedInput);
    final String? categoryId = _extractCategory(normalizedInput);
    final DateTime date = _extractDate(normalizedInput); // Defaults to today

    return ParsedExpenseData(
        amount: amount, categoryId: categoryId, date: date);
  }

  // --- 3. Helper Methods ---

  // Extracts the first number found in the string
  double? _extractAmount(String text) {
    // This regex finds both Western (123) and Arabic-Indic (١٢٣) digits
    final RegExp amountRegex = RegExp(r'(\d+|[٠-٩]+)');
    final match = amountRegex.firstMatch(text);
    if (match != null) {
      // Convert Arabic numerals to Western for parsing
      final numberString = _convertArabicNumbers(match.group(0)!);
      return double.tryParse(numberString);
    }
    return null;
  }

  // Finds the first keyword that matches a category
  String? _extractCategory(String text) {
    for (final keyword in _categoryKeywords.keys) {
      if (text.contains(keyword)) {
        return _categoryKeywords[keyword];
      }
    }
    return null; // Return null if no keyword is found
  }

  // Determines the date from keywords, defaulting to now
  DateTime _extractDate(String text) {
    if (text.contains('أمس') || text.contains('امس')) {
      return DateTime.now().subtract(const Duration(days: 1));
    }
    if (text.contains('قبل يومين')) {
      return DateTime.now().subtract(const Duration(days: 2));
    }
    // Add more logic for "last week", etc.
    return DateTime.now(); // Default to today
  }

  // --- 4. Normalization and Utility ---

  String _normalizeText(String input) {
    // Remove currency symbols to avoid confusing the amount parser
    return input.replaceAll('ريال', '').replaceAll('ر.ي', '');
  }

  String _convertArabicNumbers(String input) {
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    for (int i = 0; i < arabic.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    return input;
  }
}
