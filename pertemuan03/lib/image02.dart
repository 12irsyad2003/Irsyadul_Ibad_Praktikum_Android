import 'package:flutter/material.dart';

class Image02 extends StatelessWidget {
  const Image02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        // To allow scrolling of content
        child: Column(
          children: [
            Image.asset('assets/gambar1.jpg'), // Image 1
            Image.asset('assets/gambar2.jpg'), // Image 2
            Image.asset('assets/gambar3.jpg'), // Image 3
            Image.asset('assets/gambar4.jpg'), // Image 4
            Image.asset('assets/gambar5.jpg'), // Image 5
            Image.asset('assets/gambar6.jpg'), // Image 6
          ],
        ),
      ),
    );
  }
}