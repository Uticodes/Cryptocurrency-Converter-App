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
    final response = await userRemote.getCurrencyRates();
    print("Showing from CurrencyRepository: $response");
    return response;
  }

  @override
  Future<ConvertResponse?> convertCurrency(String from, String to, String amount) async {
    final response = await userRemote.convertCurrency(from, to, amount);
    print("Showing convertCurrency from repository : $response");
    return response;
  }

  @override
  Future<List<Symbol>?> getSymbols() async {
    return await userRemote.getSymbols();
  }

}