import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_using_provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        cartItem['imageUrl'],
                        fit: BoxFit.fill,
                        height: 80,
                        width: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartItem['title'],
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("₹${cartItem['price']}",
                            style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Size :${cartItem['sizes']}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        OutlinedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Remove from cart",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                      content: const Text(
                                          "Are you sure want to delete the product?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "No",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Provider.of<CartProvider>(context,
                                                      listen: false)
                                                  .removeProduct(cartItem);
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Yes",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    );
                                  });
                            },
                            child: const Text(
                              'Remove',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
