import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Cart App',
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final _productList = [
    ProductItem(name: "Product 1", price: 10.55),
    ProductItem(name: "Product 2", price: 20.11),
    ProductItem(name: "Product 3", price: 30.55),
    ProductItem(name: "Product 4", price: 40.11),
    ProductItem(name: "Product 5", price: 50.55),
    ProductItem(name: "Product 6", price: 60.11),
    ProductItem(name: "Product 7", price: 70.55),
    ProductItem(name: "Product 8", price: 80.11),
    ProductItem(name: "Product 9", price: 90.55),
    ProductItem(name: "Product 10", price: 10.11),
    ProductItem(name: "Product 11", price: 11.55),
    ProductItem(name: "Product 12", price: 12.11),
    ProductItem(name: "Product 13", price: 13.55),
  ];

  final Set<ProductItem> _totalUniqueProduct = {};

  void _handleCount(int index) {
    if (_productList[index].quantity < 5) {
      _productList[index].quantity++;
      _totalUniqueProduct.add(_productList[index]);
      setState(() {});
    }
    if (_productList[index].quantity == 5) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Congratulations!"),
          content: Text("You've bought 5 ${_productList[index].name}!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Ok"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Product List")),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: _productList.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _productList[index].name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text("Price: ${_productList[index].price}"),
                ],
              ),
              Column(
                children: [
                  Text("Counts: ${_productList[index].quantity}"),
                  ElevatedButton(
                    onPressed: () => _handleCount(index),
                    child: const Text("Buy Now"),
                  ),
                ],
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 20),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(
                totalProduct: _totalUniqueProduct.length,
              ),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

class ProductItem {
  final String name;
  final double price;
  int quantity;
  ProductItem({
    required this.name,
    required this.price,
    this.quantity = 0,
  });
}

class CartPage extends StatelessWidget {
  final int totalProduct;
  const CartPage({
    super.key,
    required this.totalProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Cart")),
      ),
      body: Center(
        child: Text("Total Products: $totalProduct"),
      ),
    );
  }
}