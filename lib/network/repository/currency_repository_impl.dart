import 'package:cryptocurrency_converter_app/domain/model/convert.dart';
import 'package:cryptocurrency_converter_app/domain/model/rate.dart';
import 'package:cryptocurrency_converter_app/domain/model/symbols.dart';

import '../remote/currency_remote.dart';
import 'currency_repository.dart';

class CurrencyRepositoryImpl extends CurrencyRepository {
  final CurrencyRemote userRemote;

  CurrencyRepositoryImpl(this.userRemote,);

  @override
  Future<List<Rate>?> getCurrencyRates() async {
    return await userRemote.getCurrencyRates();
  }

  @override
  Future<ConvertResponse?> convertCurrency(String from, String to, String amount) async {
    return await userRemote.convertCurrency(from, to, amount);;
  }

  @override
  Future<List<Symbol>?> getSymbols() async {
    return await userRemote.getSymbols();
  }

}