import 'package:intl/intl.dart';

extension CurrencyExtension on double {
  String toCurrency({String locale = 'en_US', String symbol = '\$'}) {
    final format = NumberFormat.currency(locale: locale, symbol: symbol);
    return format.format(this);
  }
}
