import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => _items;
  int get jumlah {
    // ignore: unnecessary_null_comparison
    return _items.length;
  }

  double get totalHarga {
    var total = 0.0;
    // ignore: unnecessary_null_comparison
    _items.forEach(
      (key, CartItem) {
        total += CartItem.qty * CartItem.price;
      },
    );
    return total;
  }

  void addCart(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      // When the product id key already exists
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          price: value.price,
          qty: value.qty + 1,
        ),
      );
    } else {
      // Adding a new product id
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          qty: 1,
        ),
      );
    }
    notifyListeners();
  }
}
