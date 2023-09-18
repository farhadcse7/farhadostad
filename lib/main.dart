import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
    if (_counter >= 5) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Button pressed $_counter times.'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'))
                ],
              ));
    }
  }

  void _decrement() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Count:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 120, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: _increment,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Text(
                        '+',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: _decrement,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        '-',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
