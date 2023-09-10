import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
      title: 'Ostad app',
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 70,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('Home',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
        leading: const Icon(Icons.add_business),
        actions: const [
          Padding(
            padding: EdgeInsets.all(14),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Live Test',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Farhad ',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                    ),
                  ),

                  TextSpan(
                    text: 'Mia ',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
