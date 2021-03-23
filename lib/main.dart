import 'package:bitcoin_ticker/contants.dart';
import 'package:bitcoin_ticker/price_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kThemeColor,
        accentColor: kThemeColor,
        brightness: Brightness.dark,
      ),
      home: PriceScreen(),
      title: "Bitcoin Ticker",
    );
  }
}
