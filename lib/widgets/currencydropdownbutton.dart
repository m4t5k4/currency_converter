import 'package:flutter/material.dart';

import 'package:currency_converter/models/currency.dart';

typedef void MyCallback(Currency currency);

class CurrencyDropdownButtonWidget extends StatelessWidget {
  final String labelText;
  final Currency selectedCurrency;
  final List<Currency> currencies;
  final MyCallback onCurrencySelected;

  CurrencyDropdownButtonWidget(
      {this.labelText,
      this.selectedCurrency,
      this.currencies,
      this.onCurrencySelected});
      
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    return Container(
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: DropdownButton<Currency>(
          isExpanded: true,
          items: currencies.map((Currency currency) {
            return DropdownMenuItem<Currency>(
              value: currency,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                      image:
                          AssetImage("assets/" + currency.shortname + ".png"),
                      width: 40.0,
                      height: 40.0),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currency.shortname,
                        textScaleFactor: 1.3,
                      ),
                      Text(currency.name),
                    ],
                  )
                ],
              ),
            );
          }).toList(),
          value: selectedCurrency,
          style: textStyle,
          onChanged: (value) {
            onCurrencySelected(value);
          },
          underline: SizedBox.shrink(),
        ),
      ),
    );
  }
}