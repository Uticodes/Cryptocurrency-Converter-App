import 'package:cryptocurrency_converter_app/domain/model/convert.dart';
import 'package:cryptocurrency_converter_app/domain/model/symbols.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../network/core/view_state.dart';
import '../utils/app_fonts.dart';
import '../utils/color.dart';
import '../widget/app_text_field.dart';
import '../ui/main_page.dart' as sharedProvider;

class ConvertPage extends StatefulHookWidget {
  const ConvertPage({Key? key}) : super(key: key);

  @override
  _ConvertPageState createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  TextEditingController _amount = TextEditingController();
  String selectedFromOption = "GBP";
  String selectedToOption = "USD";
  String result = "";

  @override
  Widget build(BuildContext context) {
    ViewState viewState = useProvider(sharedProvider.viewStateProvider);
    ConvertResponse? convertResponse = useProvider(sharedProvider.currencyProvider).convertResponse;
    double? convert = useProvider(sharedProvider.currencyProvider).convert;

    print("convertResponse convertResponse $convertResponse");

    List<Symbol>? symbols =
        useProvider(sharedProvider.currencyProvider).symbolList;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Pallet.colorBlue,
        ),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 54,
                  ),
                  AppFormField(
                    label: "Input amount to convert",
                    controller: _amount,
                    onChanged: (value) {
                      setState(() {
                        context.read(sharedProvider.currencyProvider)
                            .convertCurrency(selectedFromOption, selectedToOption, _amount.text.trim());
                      setState(() {

                      });
                      });
                    },
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return "Enter a valid email address.";
                      }
                      return null;
                    },
                    isHidden: false,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                SizedBox(
                  //height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          // height: 70,
                          width: 100,
                          child: DropdownSearch<Symbol>(
                            label: selectedFromOption,
                            items: symbols,
                            itemAsString: (Symbol? u) => u!.symbol!,
                            onChanged: (Symbol? data) => {
                              selectedFromOption = data!.symbol as String,
                            context.read(sharedProvider.currencyProvider)
                                .convertCurrency(selectedFromOption, selectedToOption, _amount.text.trim()),
                              print(data)
                            },
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Image.asset('assets/images/revert-arrows.png',
                        width: 20,),
                      ),

                      Expanded(
                          child: SizedBox(
                            width: 100,
                            child: DropdownSearch<Symbol>(
                              label: selectedToOption,
                              items: symbols,
                              itemAsString: (Symbol? u) => u!.symbol!,
                              onChanged: (Symbol? data) => {
                                selectedToOption = data!.symbol as String,
                              context.read(sharedProvider.currencyProvider)
                                  .convertCurrency(selectedFromOption, selectedToOption, _amount.text.trim()),
                                print(data)
                              },
                            ),
                          ),
                      ),

                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Pallet.colorBlue.withOpacity(0.2)),
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: const Color(0xfffffffff)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        AppFontsStyle.getAppTextViewBold(
                          "Result",
                          weight: FontWeight.w500,
                          size: AppFontsStyle.textFontSize16,
                        ),
                        const SizedBox(height: 40,),

                        AppFontsStyle.getAppTextViewBold(
                          "${convert ?? 0.0}",
                          weight: FontWeight.w500,
                          size: AppFontsStyle.textFontSize32,
                        ),
                        const SizedBox(height: 60,),
                      ],
                    ),
                  )
              ],
              ),
            )
        )
    );
  }
}
