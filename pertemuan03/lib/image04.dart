import 'package:flutter/material.dart';

class Image04 extends StatelessWidget {
  const Image04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar dari URL'),
      ),
      body: SingleChildScrollView(
        // To make the content scrollable
        child: Column(
          children: [
            buildImageCard(
                'https://media.istockphoto.com/id/474625072/id/foto/matahari-terbit-di-gunung-berapi-bromo-di-indonesia.jpg?s=2048x2048&w=is&k=20&c=GAZ5HTrXYmTQDfmJhJVhuOYAcgXh5L0Sr29AEg1ibVU='),
            buildImageCard(
                'https://cdn.idntimes.com/content-images/duniaku/post/20191219/kage-terkuat-tobirama-senju-4f785ff7a463c753eddd05d0c0e9da9b.jpg'),
            buildImageCard(
                'https://cdn.idntimes.com/content-images/community/2023/08/2906592-cropped-56965fbaa68adf470a17cc45ea5d328d-1c144a7a493a45ebf933a8015a055700_600x400.jpg'),
            buildImageCard(
                'https://img.koran-jakarta.com/images/article/masashi-kishimoto-bakal-buat-spin-off-hokage-keempat-minato-namikaze-230420120651.jpeg'),
            buildImageCard(
                'https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2022/10/23/934786489.jpg'),
          ],
        ),
      ),
    );
  }

  // Function to build image card with URL
  Widget buildImageCard(String imageUrl) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(10), // Rounded corners for the image
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover, // Ensure image covers the container
          height: 150.0, // Container height
          width: double.infinity, // Full width
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            }
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Center(
              child: const Text(
                  'Gagal memuat gambar'), // Error message if image fails to load
            );
          },
        ),
      ),
    );
  }
}