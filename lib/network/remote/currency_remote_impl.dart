
import 'dart:convert';

import 'package:cryptocurrency_converter_app/domain/model/convert.dart';
import 'package:cryptocurrency_converter_app/domain/model/rate.dart';
import 'package:cryptocurrency_converter_app/domain/model/symbols.dart';
import 'package:dio/dio.dart';

import '../core/network_config.dart';
import 'currency_remote.dart';

class CurrencyRemoteImpl extends CurrencyRemote {
  final Dio dioClient;

  CurrencyRemoteImpl(this.dioClient);

  @override
  Future<List<Rate>?> getCurrencyRates() async {
    try {
          var response = await dioClient.get(
            "${NetworkConfig.BASE_URL}/latest?access_key=${NetworkConfig.ACCESS_KEY}",
          );
          var responseData = RatesResponse.fromJson(response.data);
          print("Showing from CurrencyRemote: $response");
          print("Showing responseData CurrencyRemote: ${responseData.rates}");
          return responseData.rates;
        } catch (error) {
          handleError(error);
        }
  }

  @override
  Future<ConvertResponse?> convertCurrency(String from, String to, String amount) async {
    try {
          var response = await dioClient.get(
            "${NetworkConfig.BASE_URL}/convert?access_key=${NetworkConfig.ACCESS_KEY}&from=${from}&to=${to}&amount=${amount}"
          );
          var responseData = ConvertResponse.fromJson(response.data);
          print("Showing from convertCurrency: ${response.data}");
          print("Showing from ConvertResponse: ${responseData.result}");
          return responseData;
        } catch (error) {
      print("Showing error convertCurrency: $error");
          handleError(error);
        }
  }

  @override
  Future<List<Symbol>?> getSymbols() async {
    try {
      var response = await dioClient.get(
        "${NetworkConfig.BASE_URL}/symbols?access_key=${NetworkConfig.ACCESS_KEY}",
      );
      var responseData = SymbolsResponse.fromJson(response.data);
      print("Showing from getSymbols: $response");
      print("Showing responseData getSymbols: ${responseData.symbols}");
      return responseData.symbols;
    } catch (error) {
      handleError(error);
    }
  }

}

void handleError(dynamic error) {
  var errorString = error.response.toString();
  if (error is DioError) {
    final errorMessage = DioExceptions.fromDioError(error).toString();
    throw errorMessage;
  } else {
    var json = jsonDecode(errorString);
    var nameJson = json['error']['info'];

    throw nameJson;
  }
}

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioError.response?.statusCode ?? 444, dioError.response?.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String message = "";

  String _handleError(int statusCode, dynamic error) {
    if (statusCode >= 400 && statusCode <= 499) {
      return error["info"];
    } else if (statusCode >= 500 && statusCode <= 599) {
      return 'Internal server error';
    } else {
      return 'Opps! something went wrong';
    }
  }


  @override
  String toString() => message;
}