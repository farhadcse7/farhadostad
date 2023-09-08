import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
      title: 'Ostad app',
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 70,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Home',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.search)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is mod 5 Assignment',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'My ',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                    ),
                  ),
                  TextSpan(
                    text: 'phone ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: 'name ',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'Your phone name',
                    style: TextStyle(color: Colors.orange, fontSize: 24),
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
