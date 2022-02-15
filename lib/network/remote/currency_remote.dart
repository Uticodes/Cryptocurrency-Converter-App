
import 'package:cryptocurrency_converter_app/domain/model/convert.dart';
import 'package:cryptocurrency_converter_app/domain/model/symbols.dart';

import '../../domain/model/rate.dart';

abstract class CurrencyRemote {
  Future<List<Rate>?> getCurrencyRates();
  Future<ConvertResponse?> convertCurrency(String from, String to, String amount);
  Future<List<Symbol>?> getSymbols();
}