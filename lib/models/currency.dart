class Currency {
  String name;
  String shortname;
  double _value;

  Currency(this.name, this.shortname, this._value);

  double get value {
    return _value;
  }

  set value(double value) {
    if (value > 0) {
      this._value = value;
    }
  }
}