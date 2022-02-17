
import 'package:cryptocurrency_converter_app/domain/model/convert.dart';
import 'package:cryptocurrency_converter_app/domain/model/rate.dart';
import 'package:cryptocurrency_converter_app/domain/model/symbols.dart';
import '../../network/core/view_state.dart';
import '../../network/repository/currency_repository.dart';
import '../../main.dart';
import 'base/base_view_model.dart';

class CurrencyViewModel extends BaseViewModel {
  final userRepository = locator<CurrencyRepository>();

  ViewState _state = ViewState.Idle;
  ViewState get viewState => _state;
  String errorMessage = "";

  List<Rate>? rateList = [];
  List<Symbol>? symbolList = [];
  ConvertResponse? convertResponse;
  double? convert;


  void setViewState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  void setError(String error) {
    errorMessage = error;
    notifyListeners();
  }

  /// get rates
  Future<List<Rate>?> getCurrencyRates() async {
    try {
      setViewState(ViewState.Loading);
      var response = await userRepository.getCurrencyRates();
      setViewState(ViewState.Success);
      rateList = response ?? [];
      return response;
    } catch (error) {
      setViewState(ViewState.Error);
      setError(error.toString());
    }
    notifyListeners();
  }

  ///get symbols
  Future<List<Symbol>?> getSymbols() async {
    try {
      setViewState(ViewState.Loading);
      var response =  await userRepository.getSymbols();
      symbolList = response;
      return response;
    } catch (error) {
      setViewState(ViewState.Error);
      setError(error.toString());
    }
    notifyListeners();
  }

  /// convert currency
  Future<ConvertResponse?> convertCurrency(String from, String to, String amount) async {
    try {
      setViewState(ViewState.Loading);
      var response = await userRepository.convertCurrency(from, to, amount);
      convertResponse = response;
      convert = response?.result ?? 0.0;
      setViewState(ViewState.Success);
      return response;
    } catch (error) {
      setViewState(ViewState.Error);
      setError(error.toString());
    }
    notifyListeners();
  }

}