import 'dart:convert';

import 'package:cryptocurrency_converter_app/domain/model/rate.dart';
import 'package:cryptocurrency_converter_app/route/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../network/core/view_state.dart';
import '../domain/viewmodel/currency_viewmodel.dart';
import '../main.dart';
import '../utils/api_client.dart';
import '../utils/app_fonts.dart';
import '../utils/color.dart';
import '../widget/app_progress_bar.dart';
import '../widget/button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final currencyProvider =
ChangeNotifierProvider.autoDispose<CurrencyViewModel>((ref) {
  ref.onDispose(() {});
  final viewModel = locator.get<CurrencyViewModel>();
  viewModel.getCurrencyRates();
  viewModel.getSymbols();
  return viewModel;
});

final _viewStateProvider = Provider.autoDispose<ViewState>((ref) {
  return ref.watch(currencyProvider).viewState;
});
final viewStateProvider = Provider.autoDispose<ViewState>((ref) {
  return ref.watch(_viewStateProvider);
});

class MyHomePage extends StatefulHookWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _amount = TextEditingController();
  ApiClient client = ApiClient();
  List<String>? currencies;
  List<String>? currencyList;
  String from = "";
  String? to;
  double? rate;
  String result = "";
  final Dio dioClient = Dio();

  Future<List<String>?> getCurrencyList() async {
    return await client.getCurrencies();
  }

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ViewState viewState = useProvider(viewStateProvider);

    List<Rate>? rateList =
        useProvider(currencyProvider).rateList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallet.colorBlue,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      rateList?.isNotEmpty == true
                          ? viewState == ViewState.Loading
                          ? Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Center(child: AppProgressBar()),
                      )
                          : Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            color: Color(0xfffffffff)),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(rateList!.length, (index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        RatesView(
                                            "${rateList[index].title}",
                                            "${rateList[index].value}"
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      )
                          : Center(child: Padding(
                            padding: const EdgeInsets.only(top: 150.0),
                            child: AppProgressBar(),
                          )),

                      // Center(
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                      //     child: Container(
                      //       child: AppFontsStyle.getAppTextViewBold(
                      //           "No currency rates available yet",
                      //           size: AppFontsStyle.textFontSize12,
                      //           weight: FontWeight.w600,
                      //           textAlign: TextAlign.center,
                      //           color: Pallet.colorGrey
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      SizedBox(height: 32.0,),

                      const SizedBox(
                        height: 24.0,
                      ),

                      // SizedBox(
                      //   height: 260,
                      //     //width: 200,
                      //     child: Row(
                      //   children: [
                      //     customDropDown(
                      //         currencies ?? [],
                      //         from ?? "",
                      //             (from){
                      //
                      //         })
                      //   ],
                      // )
                      // )

                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AppButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed(AppRoutes.convert);
                      },
                      title: "Convert Currency",
                      disabledColor: Pallet.colorBlue.withOpacity(0.2),
                      titleColor: Pallet.colorWhite,
                      enabledColor: Pallet.colorBlue,
                      enabled: true),
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}

class RatesView extends StatefulWidget {
  //Function()? onDeleteClicked;
  String symbol;
  String value;

  RatesView(
      this.symbol,this.value,
      {Key? key})
      : super(key: key);

  @override
  _RatesViewState createState() => _RatesViewState();
}

class _RatesViewState extends State<RatesView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Pallet.colorBlue.withOpacity(0.2)),
          borderRadius: BorderRadius.all(Radius.circular(2)),
          color: const Color(0xfffffffff)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppFontsStyle.getAppTextViewBold(
              widget.symbol,
              weight: FontWeight.w500,
              size: AppFontsStyle.textFontSize16,
            ),
            const Spacer(),
            AppFontsStyle.getAppTextViewBold(
              widget.value,
              weight: FontWeight.w500,
              size: AppFontsStyle.textFontSize20,
            ),
          ],
        ),
      ),
    );
  }
}