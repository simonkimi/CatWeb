import 'package:catweb/data/controller/setting_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../navigator.dart';

class PrefValue<T> extends ChangeNotifier {
  PrefValue(this._key, this._value, {this.converter});

  final _pref = get<SharedPreferences>();
  final String _key;
  final T Function(int)? converter;
  T _value;

  void setValue(T value) {
    _value = value;
    save();
    notifyListeners();
  }

  void initValue() {
    switch (_value) {
      case int _:
        _value = _pref.getInt(_key) as T;
        break;
      case double _:
        _value = _pref.getDouble(_key) as T;
        break;
      case String _:
        _value = _pref.getString(_key) as T;
        break;
      case bool _:
        _value = _pref.getBool(_key) as T;
        break;
      case IEnumValue _:
        assert(converter != null);
        _value = converter!(_pref.getInt(_key) ?? 0);
        break;
      default:
        throw Exception('Unknown type: $T');
    }
  }

  void save() {
    switch (_value) {
      case int v:
        _pref.setInt(_key, v);
        break;
      case double v:
        _pref.setDouble(_key, v);
        break;
      case String v:
        _pref.setString(_key, v);
        break;
      case bool v:
        _pref.setBool(_key, v);
        break;
      default:
        throw Exception('Unknown type: $T');
    }
  }

  T get value => _value;
  set value(T value) => setValue(value);
}
