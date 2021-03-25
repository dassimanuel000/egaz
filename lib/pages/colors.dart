import 'dart:ui';
import 'package:flutter/material.dart';

const blue = Color(0xFF4781ff);
const kTitleStyle = TextStyle(
    fontSize: 30, color: Color(0xFF01002f), fontWeight: FontWeight.bold);
const kSubtitleStyle = TextStyle(fontSize: 22, color: Color(0xFF88869f));

Color secondaryTextColor = Color(0xFFE4979E);
Color titleTextColor = Colors.white;
Color contentTextColor = Color(0xff868686);
Color navigationColor = Color(0xFF6751B5);
Color gradientStartColor = Color(0xFF0050AC);
Color gradientEndColor = Color(0xFF9354B9);

/*
  final appTheme = ThemeData(
    primaryColor: Colors.blueAccent,
  );

  const kBackgroundColor = Color(0xFFF8F8F8);
  const kActiveIconColor = Color(0xFFE68342);
  const kTextColor = Color(0xFF222B45);
  const kBlueLightColor = Color(0xFFC7B8F5);
  const kBlueColor = Color(0xFF817DC0);
  const kShadowColor = Color(0xFFE6E6E6);*/

class AppStyleModeNotifier extends ChangeNotifier {
  Color firstColor = Colors.blueAccent;
  Color secondColor = Colors.blueAccent.withOpacity(0.3);
  Color thirdColor = Color(0xFF7A36DC).withOpacity(0.1);

  int mode = 0; //0 for light and 1 for dark
  Color primaryBlue = Color(0xDD01549F);
  Color primaryBackgroundColor = Colors.grey[100];
  Color primaryTextColorDark = Colors.grey[900];
  Color primaryTextColorLight = Colors.grey;
  Color primaryTextColor = Colors.grey[800];
  Color primaryMessageBoxColor = Colors.blue;
  Color secondaryMessageBoxColor = Colors.grey[300];
  Color primaryMessageTextColor = Colors.white;
  Color secondaryMessageTextColor = Colors.grey[800];
  Color typeMessageBoxColor = Colors.grey[200];
  Color backgroundWhite = Colors.white;
  Color buttonWhite = Colors.white;

  switchMode() {
    if (mode == 0) {
      //if it is light mode currently switch to dark
      primaryBackgroundColor = Colors.grey[900];
      primaryTextColorDark = Colors.grey[100];
      primaryTextColorLight = Colors.grey;
      primaryTextColor = Colors.grey[50];
      primaryMessageBoxColor = Colors.blue;
      secondaryMessageBoxColor = Colors.grey[800];
      primaryMessageTextColor = Colors.white;
      secondaryMessageTextColor = Colors.white;
      typeMessageBoxColor = Colors.grey[800];
      backgroundWhite = Color(0xFF222B45);
      primaryBlue = Color(0xDD01149F);
      buttonWhite = Colors.white;
      mode = 1;
    } else {
      //if it is dark mode currently switch to light
      primaryBackgroundColor = Colors.grey[100];
      primaryTextColorDark = Colors.grey[900];
      primaryTextColorLight = Colors.grey;
      primaryTextColor = Colors.grey[800];
      primaryMessageBoxColor = Colors.blue;
      secondaryMessageBoxColor = Colors.grey[300];
      primaryMessageTextColor = Colors.white;
      secondaryMessageTextColor = Colors.grey[800];
      typeMessageBoxColor = Colors.grey[200];
      backgroundWhite = Colors.white;
      buttonWhite = Colors.white;
      primaryBlue = Color(0xDD01549F);
      mode = 0;
    }

    notifyListeners();
  }
}
