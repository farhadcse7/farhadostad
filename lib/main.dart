import 'package:flutter/material.dart';

void main() {
  // give me some widget
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      title: 'Ostad app',
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('My Shopping List')),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],

      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Apples'),
            leading: Icon(Icons.shopping_bag),
          ),
          ListTile(
            title: Text('Bananas'),
            leading: Icon(Icons.shopping_bag),
          ),
          ListTile(
            title: Text('Bread'),
            leading: Icon(Icons.shopping_bag),
          ),
          ListTile(
            title: Text('Milk'),
            leading: Icon(Icons.shopping_bag),
          ),
          ListTile(
            title: Text('Eggs'),
            leading: Icon(Icons.shopping_bag),
          ),
        ],
      ),
    );
  }
}