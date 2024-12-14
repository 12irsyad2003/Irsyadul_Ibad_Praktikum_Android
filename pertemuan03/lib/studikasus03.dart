import 'package:flutter/material.dart';

class Studikasus03 extends StatefulWidget {
  const Studikasus03({super.key});

  @override
  State<Studikasus03> createState() => _Studikasus03State();
}

class _Studikasus03State extends State<Studikasus03> {
  String? _pilihan;
  String url = '';

  // Map untuk menyimpan pilihan Hokage dan URL gambarnya
  final Map<String, String> hokageImages = {
    'Hokage 1':
        'https://static.wikia.nocookie.net/naruto/images/3/30/Hokage_Hashirama.png/revision/latest/scale-to-width-down/1911?cb=20140406065909&path-prefix=id',
    'Hokage 2':
        'https://cdn.idntimes.com/content-images/duniaku/post/20191219/kage-terkuat-tobirama-senju-4f785ff7a463c753eddd05d0c0e9da9b.jpg',
    'Hokage 3':
        'https://cdn.idntimes.com/content-images/community/2023/08/2906592-cropped-56965fbaa68adf470a17cc45ea5d328d-1c144a7a493a45ebf933a8015a055700_600x400.jpg',
    'Hokage 4':
        'https://img.koran-jakarta.com/images/article/masashi-kishimoto-bakal-buat-spin-off-hokage-keempat-minato-namikaze-230420120651.jpeg',
    'Hokage 5':
        'https://upload.wikimedia.org/wikipedia/commons/f/f5/Naruto_Uzumaki.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Hokage'),
      ),
      body: Column(
        children: [
          // DropdownButton sebagai combobox
          DropdownButton<String>(
            value: _pilihan,
            hint: Text('Pilih Hokage'),
            items: hokageImages.keys.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _pilihan = value;
                url = hokageImages[value] ?? '';
              });
            },
          ),
          // Menampilkan pilihan yang dipilih
          Text(
            'Pilihan Anda: $_pilihan',
            style: const TextStyle(fontSize: 20),
          ),
          // Menampilkan gambar jika ada URL
          buildImageCard(url),
        ],
      ),
    );
  }

  // Fungsi untuk membangun kotak gambar
  Widget buildImageCard(String imageUrl) {
    return imageUrl.isEmpty
        ? Container() // Jika URL kosong, tidak menampilkan gambar
        : Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), // Sudut melengkung
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10), // Sudut melengkung untuk gambar
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover, // Memastikan gambar penuh di dalam kontainer
                height: 150.0, // Tinggi kontainer
                width: double.infinity, // Lebar penuh
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null),
                  );
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return const Center(child: Text('Gagal memuat gambar'));
                },
              ),
            ),
          );
  }
}
