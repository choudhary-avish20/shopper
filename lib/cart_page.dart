import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(cartItem['image_url'].toString()),
              ),
              title: Text(
                cartItem['title'].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text("Specs: ${cartItem['specs']}"),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Delete Phone",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: Text("Are you sure to remove the product?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Provider.of<CartProvider>(
                                context,
                                listen: false,
                              ).remProduct(cartItem);
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "No",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.delete),
                color: Colors.deepOrangeAccent,
              ),
            );
          },
        ),
      ),
    );
  }
}
