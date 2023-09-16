import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Farhad App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //image list added from https://picsum.photos/ website and randomly generated from there
  List<String> imagesUrl = [
    'https://picsum.photos/104',
    'https://picsum.photos/105',
    'https://picsum.photos/106',
    'https://picsum.photos/107',
    'https://picsum.photos/108',
    'https://picsum.photos/109',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        centerTitle: true,
      ),
      //body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for photos...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            //padding with 6 images using gridview builder
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: imagesUrl.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return GridTile(
                    footer: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                            child: Text(
                          "tile ${index + 1}",
                          style: const TextStyle(fontSize: 20),
                        )),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Image ${index + 1} clicked!'),
                          ),
                        );
                      },
                      child: Container(
                        height: 150,
                        color: Colors.grey,
                        child: Image.network(
                          imagesUrl[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // 3 images with title and subtitle using ListTile
            SizedBox(
              child: Column(
                children: [
                  ListTile(
                    leading: ClipOval(
                        child: Image.network('https://picsum.photos/100')),
                    title: const Text('Photo 1'),
                    subtitle: const Text('Description for Photo 1'),
                  ),
                  ListTile(
                    leading: ClipOval(
                        child: Image.network('https://picsum.photos/101')),
                    title: const Text('Photo 2'),
                    subtitle: const Text('Description for Photo 2'),
                  ),
                  ListTile(
                    leading: ClipOval(
                        child: Image.network('https://picsum.photos/102')),
                    title: const Text('Photo 3'),
                    subtitle: const Text('Description for Photo 3'),
                  ),
                ],
              ),
            ),

            //More spaces
            const SizedBox(height: 30),

            // Floating upload button
            FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Photos Uploaded Successfully!'),
                  ),
                );
              },
              child: const Icon(Icons.upload),
            ),
          ],
        ),
      ),
    );
  }
}
