import 'dart:async';

import 'package:cryptocurrency_converter_app/route/routes.dart';
import 'package:cryptocurrency_converter_app/ui/main_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'network/core/config.dart';
import 'network/remote/currency_remote.dart';
import 'network/remote/currency_remote_impl.dart';
import 'network/repository/currency_repository.dart';
import 'network/repository/currency_repository_impl.dart';
import 'domain/viewmodel/currency_viewmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Config.appFlavor = Flavor.DEVELOPMENT;
  setupLocator();
  runZonedGuarded(() {
    runApp(const ProviderScope(child: MyApp()));
  }, (dynamic error, dynamic stack) {
    print(error);
    print(stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cryptocurrency Converter'),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

GetIt locator = GetIt.instance;

void setupLocator() {
  setupDio();
  locator.registerFactory<CurrencyRemote>(() => CurrencyRemoteImpl(locator<Dio>()));
  locator.registerFactory<CurrencyRepository>(
          () => CurrencyRepositoryImpl(locator<CurrencyRemote>()));

  registerViewModels();
}

void setupDio() {
  locator.registerFactory(() {
    Dio dio = Dio();
    /*TODO Confirm headers*/
    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  });
}

void registerViewModels() {
  /* TODO Setup viewModels*/
  locator.registerFactory(() => CurrencyViewModel());

}


