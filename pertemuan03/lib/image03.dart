import 'package:flutter/material.dart';

class Image03 extends StatelessWidget {
  const Image03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        // To make the content scrollable
        child: Column(
          children: [
            buildImageCard('assets/gambar1.jpg', Colors.red),
            buildImageCard('assets/gambar2.jpg', Colors.green),
            buildImageCard('assets/gambar3.jpg', Colors.blue),
            buildImageCard('assets/gambar4.jpg', Colors.yellow),
            buildImageCard('assets/gambar5.jpg', Colors.orange),
            buildImageCard('assets/gambar6.jpg', Colors.purple),
          ],
        ),
      ),
    );
  }

  // Function to build image card with color
  Widget buildImageCard(String imagePath, Color color) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(10), // Rounded corners for the image
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover, // Ensure image covers the container
          height: 150.0, // Container height
          width: double.infinity, // Full width
        ),
      ),
    );
  }
}