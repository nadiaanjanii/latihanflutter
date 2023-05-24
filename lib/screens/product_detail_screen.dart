import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/all_products.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import '../screens/cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as String?; // is the id!
    final product = Provider.of<Products>(context, listen: false)
        .findById(args!); // Use context.read to access the provider
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) {
              return Badges(
                value: value.jumlah.toString(),
                color: Colors.white,
                child: ch!,
              );
            },
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName,
                );
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Image.network(
              product.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            product.title!,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(
            product.description!,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 30),
          Text(
            product.price.toString(),
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 30),
          OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Berhasil ditambahkan"),
                  duration: Duration(milliseconds: 500),
                ),
              );
              cart.addCart(product.id.toString(), product.title.toString(),
                  product.price!.toDouble());
            },
            child: const Text(
              "Add To Cart",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
