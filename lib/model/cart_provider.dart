import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/model/db_helper.dart';
import 'package:shopping_cart/model/shopping_detail_model.dart';

class CartProvider with ChangeNotifier {
  DBhelper db = DBhelper();
  int _counter = 0;
  int get counter => _counter;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  late Future<List<CartModel>> _cart;
  Future<List<CartModel>> get cart => _cart;

  Future<List<CartModel>> getData() async {
    _cart = db.getCartList();
    return _cart;
  }

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
