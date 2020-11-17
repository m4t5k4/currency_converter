import 'package:currency_converter/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/widgets/currencydropdownbutton.dart';

class ConverterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConverterPageState();
}

class _ConverterPageState extends State {
  TextEditingController amountController = TextEditingController();
  String _fromamount = "";
  String _toamount = "";
  Currency _from;
  Currency _to;

  final _currencies = [
    Currency('US Dollar', 'USD', 1),
    Currency('Euro', 'EUR', 1.16),
    Currency('British Pound', 'GBP', 1.2715),
    Currency('Indian Rupee', 'INR', 0.0135),
    Currency('Chinese yuan', 'CNY', 0.1466),
    Currency('Canadian Dollar', 'CAD', 0.7458),
    Currency('Singapore Dollar', 'SGD', 0.7268)
  ];

  @override
  void initState() {
    super.initState();
    this._from = _currencies[1];
    this._to = _currencies[0];
  }

  void _reset() {
    amountController.text = '';
    setState(() {
      _fromamount = '';
      _toamount = '';
    });
  }

 void _calculate() {
    double _amount = double.parse(amountController.text);
    double _result = _amount * _from.value / _to.value;

    setState(() {
      _fromamount = _amount.toStringAsFixed(3) + ' ' + _from.shortname + ' =';
      _toamount = _result.toStringAsFixed(3) + ' ' + _to.shortname;
    });
  }

  void _onFromChanged(Currency currency) {
    setState(() {
      this._from = currency;
    });
  }

  void _onToChanged(Currency currency) {
    setState(() {
      this._to = currency;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    double _formPadding = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: _formPadding, top: _formPadding),
              child: TextField(
                controller: amountController,
                style: textStyle,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "e.g. 17.85",
                  labelText: "Amount",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.only(bottom: _formPadding, top: _formPadding),
                child: CurrencyDropdownButtonWidget(
                    labelText: "From",
                    selectedCurrency: _from,
                    currencies: _currencies,
                    onCurrencySelected: (currency) {
                      _onFromChanged(currency);
                    }),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: _formPadding, top: _formPadding),
                child: CurrencyDropdownButtonWidget(
                    labelText: "To",
                    selectedCurrency: _to,
                    currencies: _currencies,
                    onCurrencySelected: (currency) {
                      _onToChanged(currency);
                    }),
              ),
            Container(
              height: _formPadding,
            ),
            Row(children: [
              Expanded(
                child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    _calculate();
                  },
                  child: Text(
                    'Convert',
                    textScaleFactor: 1.5,
                  ),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  color: Theme.of(context).buttonColor,
                  textColor: Theme.of(context).primaryColorDark,
                  onPressed: () {
                    _reset();
                  },
                  child: Text(
                    'Reset',
                    textScaleFactor: 1.5,
                  ),
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.only(top: _formPadding * 5),
              child: Text(
                _fromamount,
                style: textStyle,
                textScaleFactor: 1.2,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: _formPadding),
              child: Text(
                _toamount,
                style: textStyle,
                textScaleFactor: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
