import 'dart:math';
import 'package:flutter/material.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  final List<Product> allproducts = List.generate(
    25,
    (index) {
      return Product(
        id: "id${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl:
            'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1634025439/01811e4ca70ef66c3255d0684210b8df.jpg',
      );
    },
  );

  List<Product> get allProducts {
    return allproducts;
  }

  Product findById(String productId) {
    return allproducts.firstWhere((prod) => prod.id == productId);
  }
}
