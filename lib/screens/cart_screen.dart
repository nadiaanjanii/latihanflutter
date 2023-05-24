import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Total Harga : \$${cartData.totalHarga}",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${cartData.items.values.toList()[index].title}"),
                  subtitle:
                      Text("${cartData.items.values.toList()[index].qty}"),
                  trailing: Container(
                    child: Text(
                        "${cartData.items.values.toList()[index].qty} *  ${cartData.items.values.toList()[index].qty}}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
