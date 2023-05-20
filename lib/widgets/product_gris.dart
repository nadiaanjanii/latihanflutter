import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import '../models/product.dart';

// ignore: camel_case_types
class Product_Grid extends StatelessWidget {
  const Product_Grid({
    super.key,
    required this.loadedProducts,
  });

  final List<Product> loadedProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ProductItem(
        id: loadedProducts[i].id!,
        title: loadedProducts[i].title!,
        imageUrl: loadedProducts[i].imageUrl!,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
