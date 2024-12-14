import 'package:flutter/material.dart';

class HasilIpkPage extends StatelessWidget {
  final double ipk;
  final double totalSks;
  final List<String?> selectedMatakuliah;
  final List<int> sksMatakuliah;
  final List<String?> selectedNilai;

  HasilIpkPage({
    required this.ipk,
    required this.totalSks,
    required this.selectedMatakuliah,
    required this.sksMatakuliah,
    required this.selectedNilai,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hasil IPK')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan setiap mata kuliah dan nilai
            Expanded(
              child: ListView.builder(
                itemCount: selectedMatakuliah.length,
                itemBuilder: (context, index) {
                  String nilai = selectedNilai[index] ?? 'Belum Dipilih';

                  return ListTile(
                    title: Text('${selectedMatakuliah[index]}'),
                    subtitle:
                        Text('Nilai: $nilai, SKS: ${sksMatakuliah[index]}'),
                  );
                },
              ),
            ),
            // Menampilkan Total SKS dan IPK di bawah
            SizedBox(height: 16),
            Text('Total SKS: ${totalSks.toInt()}',
                style: TextStyle(fontSize: 18)),
            Text('IPK: ${ipk.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
