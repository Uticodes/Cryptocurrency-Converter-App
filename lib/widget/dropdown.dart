
import 'package:flutter/material.dart';

Widget customDropDown(
    List<String> items,
    String value,
    Function(String) onChanged
    ){
  return Container(
    //width: 40,
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
    child: DropdownButton<String>(
      value: value,
      isExpanded: true,
      onChanged: (String? value){
        onChanged(value!);
      },
      items: items
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  );
}