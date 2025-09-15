import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;

  const Product({required this.name, required this.price});
}

class S4536 extends StatelessWidget {
  const S4536({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product(name: 'Monitor', price: '1300'),
      Product(name: 'Maus', price: '80'),
      Product(name: 'Tastatur', price: '130'),
      Product(name: 'PC', price: '3500'),
      Product(name: 'Monitor', price: '1.300'),
    ];

    return ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(products[index].name),
              subtitle: Text('${products[index].price}€'),
            ));
  }
}
