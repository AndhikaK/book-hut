import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    print(_isDarkTheme);
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      accentColor: Color(0xffE1E7FF),
      accentIconTheme: IconThemeData(
        color: Colors.red,
      ),
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Color(0xffF5F6FB),
      fontFamily: 'Montserrat',
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xffF5F6FB),
        centerTitle: true,
        elevation: 0,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.pink,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.pink,
        ));
  }
}
