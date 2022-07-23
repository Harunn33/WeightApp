import 'package:flutter/material.dart';
import 'package:getxuse/config/generalColors.dart';

class DatePickerTheme extends StatelessWidget {
  Widget? child;
  DatePickerTheme({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.from(
            colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: ColorsPalette.whiteColor,
          onPrimary: ColorsPalette.darkSeaGreen,
          secondary: ColorsPalette.seaGreen,
          onSecondary: ColorsPalette.seaGreen,
          error: ColorsPalette.redColor,
          onError: ColorsPalette.redColor,
          background: ColorsPalette.darkSeaGreen,
          onBackground: ColorsPalette.darkSeaGreen,
          surface: ColorsPalette.seaGreen,
          onSurface: ColorsPalette.whiteColor,
        )),
        child: child ?? Text(""));
  }
}
