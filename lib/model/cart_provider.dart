import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  void setPrefItems() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('cartItems', _counter);
    sp.setDouble('totalPrice', _totalPrice);
    notifyListeners();
  }

  void getPrefItems() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _counter = sp.getInt('cartItems') ?? 0;
    _totalPrice = sp.getDouble("totalPrice") ?? 0.0;

    notifyListeners();
  }

  void addTotalPrice(double productprice) {
    _totalPrice = _totalPrice + productprice;
    setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double productprice) {
    _totalPrice = _totalPrice - productprice;
    setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    getPrefItems();
    return _totalPrice;
  }

//====================================
  void addCounter() {
    _counter++;
    setPrefItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    getPrefItems();
    return _counter;
  }
}
