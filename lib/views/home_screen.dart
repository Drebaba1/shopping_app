import 'package:flutter/material.dart';
import 'package:shopping_app/views/checkout.dart';
import 'product_screen.dart';

import '../model/product_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Product> _checkoutItems = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addProductToCheckout(Product product) {
    if (_checkoutItems.contains(product)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${product.name} is already in the cart')),
      );
    } else {
      setState(() {
        _checkoutItems.add(product);
      });
    }
  }

  void _removeProductFromCheckout(Product product) {
    setState(() {
      _checkoutItems.remove(product);
    });
  }

  static List<Product> _products = [
    Product(
        id: '1',
        name: 'Bread with Beans',
        price: 99.99,
        imageUrl: 'assets/jpg/bread_beans.jpg'),
    Product(
        id: '2',
        name: 'Abak_soup with Pounded Yam',
        price: 79.99,
        imageUrl: 'assets/jpg/abak_soup.jpg'),
    Product(
        id: '3', name: 'Akara', price: 59.99, imageUrl: 'assets/jpg/akara.jpg'),
    Product(
        id: '4',
        name: 'Burger',
        price: 69.99,
        imageUrl: 'assets/jpg/burger.jpg'),
    Product(
        id: '5',
        name: 'Jollof',
        price: 89.99,
        imageUrl: 'assets/jpg/jollof.jpg'),
    Product(
        id: '6',
        name: 'Moi-Moi',
        price: 9.99,
        imageUrl: 'assets/jpg/moi_moi.jpg'),
    Product(
        id: '7', name: 'Okro', price: 59.99, imageUrl: 'assets/jpg/okro.jpg'),
    Product(
        id: '8',
        name: 'Rice with Efo',
        price: 39.99,
        imageUrl: 'assets/jpg/rice_efo.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      ProductScreen(
          products: _products, addProductToCheckout: _addProductToCheckout),
      CheckoutScreen(
          checkoutItems: _checkoutItems,
          removeProductFromCheckout: _removeProductFromCheckout),
    ];

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Checkout',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
