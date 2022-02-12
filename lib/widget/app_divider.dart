
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1.5, color: Colors.black12.withOpacity(0.1));
  }
}