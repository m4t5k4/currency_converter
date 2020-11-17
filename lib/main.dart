import 'package:flutter/material.dart';
import 'package:currency_converter/pages/converter.dart';

void main() => runApp(new CurrencyConverterApp());

class CurrencyConverterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ConverterPage(),
    );
  }
}