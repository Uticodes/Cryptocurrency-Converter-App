import 'package:cryptocurrency_converter_app/utils/app_fonts.dart';
import 'package:cryptocurrency_converter_app/utils/color.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class AppFormField extends StatefulWidget {
  bool? focus;
  TextEditingController? controller = TextEditingController();

  /**
   * Look at the decorator declared here before duplicating and passing your own
   */
  InputDecoration? decorator;
  double? height;
  double? width;
  String label;
  Widget? suffixIcon;
  Function()? onTap;
  FormFieldValidator<String>? validator;
  Function(String)? onChanged;
  bool? enabled = true;
  TextInputType? keyboardType;
  bool isHidden = true;

  AppFormField(
      {Key? key, this.controller,
        this.decorator,
        this.height,
        this.width,
        required this.label,
        this.suffixIcon,
        this.onTap,
        this.enabled,
        this.validator,
        this.onChanged,
        this.keyboardType,
        required this.isHidden
      }) : super(key: key);

  @override
  _AppFormFieldState createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  void _onFocusChange(bool focus) {
    setState(() {
      widget.focus = focus;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        border: widget.focus == true
            ? Border.all(width: 1.0, color: Pallet.colorBlue)
            : Border.all(width: 1.0, color: Pallet.colorBlue),
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
      child: FocusScope(
          child: Focus(
              onFocusChange: (focus) => _onFocusChange(focus),
              child: TextFormField(
                enabled: widget.enabled ?? true,
                controller: widget.controller,
                onTap: widget.onTap ??
                        () {
                      _onFocusChange(true);
                    },
                keyboardType: widget.keyboardType ?? const TextInputType.numberWithOptions(decimal: true),
                onChanged: widget.onChanged,
                validator: widget.validator,
                maxLines: 1,
                style: TextStyle(
                  color: Pallet.colorBlue,
                  fontSize: AppFontsStyle.textFontSize14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                ),
                obscureText: widget.isHidden,
                decoration: widget.decorator ??
                    InputDecoration(
                      suffixIcon: widget.suffixIcon,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: widget.label,
                      contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                      labelStyle: TextStyle(
                        color: Pallet.colorBlue,
                        fontWeight: FontWeight.w300,
                        backgroundColor: null,
                        background: null,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),

              ))),
    );
  }
}



class AmountFormField extends StatefulWidget {
  bool? focus;
  TextEditingController? controller = new TextEditingController();

  /**
   * Look at the decorator declared here before duplicating and passing your own
   */
  InputDecoration? decorator;
  double? height;
  String label;
  Widget? icon;
  Function()? onTap;
  FormFieldValidator<String>? validator;
  Function(String)? onChanged;
  bool? enabled = true;
  Widget? dropdown;

  AmountFormField(
      {Key? key, this.controller,
        this.decorator,
        this.height,
        required this.label,
        this.icon,
        this.onTap,
        this.enabled,
        this.validator,
        this.onChanged,
        this.dropdown}) : super(key: key);

  @override
  _AmountFormFieldState createState() => _AmountFormFieldState();
}

class _AmountFormFieldState extends State<AmountFormField> {
  void _onFocusChange(bool focus) {
    setState(() {
      widget.focus = focus;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
      height: widget.height,
      decoration: BoxDecoration(
        border: widget.focus == true
            ? Border.all(width: 1.0, color: Pallet.colorBlue)
            : Border.all(width: 1.0, color: Pallet.colorBlue),
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: FocusScope(
                child: Focus(
                    onFocusChange: (focus) => _onFocusChange(focus),
                    child: TextFormField(
                      enabled: widget.enabled ?? true,
                      controller: widget.controller,
                      onTap: widget.onTap ??
                              () {
                            _onFocusChange(true);
                          },
                      onChanged: widget.onChanged,
                      validator: widget.validator,
                      maxLines: null,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      // style: GoogleFonts.manrope(
                      //   color: Pallet.colorBlue,
                      //   fontSize: AppFontsStyle.textFontSize14,
                      //   fontWeight: FontWeight.w500,
                      //   fontStyle: FontStyle.normal,
                      // ),
                      decoration: widget.decorator ??
                          InputDecoration(
                            suffixIcon: widget.icon,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: widget.label,
                            contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                            // labelStyle: GoogleFonts.manrope(
                            //   color: Pallet.colorGrey,
                            //   fontWeight: FontWeight.w200,
                            //   backgroundColor: null,
                            //   background: null,
                            // ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                    ))),
          ),
          Container(
            //height: 60,
            width: 40,
            child: widget.dropdown,
          ),
          const SizedBox(width: 16,)
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0, right: 16.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Pallet.colorBackground,
          //       borderRadius: BorderRadius.all(Radius.circular(2)),
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          //       child: AppFontsStyle.getAppTextViewBold("Max",
          //           weight: FontWeight.w400,
          //           size: AppFontsStyle.textFontSize10),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}