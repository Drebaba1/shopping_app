import 'package:flutter/material.dart';
import 'package:shopping_app/views/order_successful.dart';
import 'package:shopping_app/model/product_model.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Product> checkoutItems;
  final Function(Product) removeProductFromCheckout;

  CheckoutScreen(
      {required this.checkoutItems, required this.removeProductFromCheckout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: ListView.builder(
        itemCount: checkoutItems.length,
        itemBuilder: (context, index) {
          final product = checkoutItems[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: IconButton(
              onPressed: () => removeProductFromCheckout(product),
              icon: Icon(Icons.delete_forever),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderSuccessfulScreen()),
            );
          },
          child: Text('Place Order'),
        ),
      ),
    );
  }
}
