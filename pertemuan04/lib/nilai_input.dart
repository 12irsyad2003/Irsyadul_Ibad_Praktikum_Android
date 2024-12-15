import 'package:flutter/material.dart';
import 'konversi.dart';
import 'hasil_ipk.dart';

void main() {
  runApp(MaterialApp(
    home: NilaiMatakuliahPage(),
  ));
}

class NilaiMatakuliahPage extends StatefulWidget {
  @override
  _NilaiMatakuliahPageState createState() => _NilaiMatakuliahPageState();
}

class _NilaiMatakuliahPageState extends State<NilaiMatakuliahPage> {
  List<String> matakuliah = [
    'Pemrograman Berbasis Objek',
    'Teknologi Multimedia',
    'Analisis dan Desain Sistem Informasi',
    'Teknik Kompilasi',
    'Interaksi Manusia dan Komputer',
    'Statistik dan Probabilitas',
    'E-commerce',
    'Kecerdasan Buatan',
    'Rekayasa Perangkat Lunak',
    'Pemrograman Visual'
  ];
  List<int> sksMatakuliah = [3, 2, 2, 2, 2, 2, 2, 3, 2, 3];
  List<String?> selectedNilai = List.filled(10, null);
  List<String?> selectedMatakuliah = List.filled(10, null);
  Konversi konversi = Konversi();

  // Variabel untuk Nama dan NPM
  String? nama;
  String? npm;

  // Fungsi untuk menghitung IPK dan total SKS
  Map<String, double> hitungIPKdanSks() {
    double totalBobot = 0.0;
    double totalSks = 0.0;

    for (int i = 0; i < matakuliah.length; i++) {
      if (selectedNilai[i] != null && selectedMatakuliah[i] != null) {
        double bobotNilai = konversi.nilaiKeAngka(selectedNilai[i]!);
        totalBobot += bobotNilai * sksMatakuliah[i];
        totalSks += sksMatakuliah[i];
      }
    }

    double ipk = totalSks > 0 ? totalBobot / totalSks : 0.0;

    return {'IPK': ipk, 'Total SKS': totalSks};
  }

  List<String> getAvailableMatakuliah(int index) {
    List<String> availableMatakuliah = List.from(matakuliah);
    for (int i = 0; i < selectedMatakuliah.length; i++) {
      if (i != index && selectedMatakuliah[i] != null) {
        availableMatakuliah.remove(selectedMatakuliah[i]);
      }
    }
    return availableMatakuliah;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Nilai Matakuliah')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Input Nama
            TextField(
              decoration: InputDecoration(labelText: 'Nama'),
              onChanged: (value) {
                setState(() {
                  nama = value;
                });
              },
            ),
            SizedBox(height: 16),
            // Input NPM
            TextField(
              decoration: InputDecoration(labelText: 'NPM'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  npm = value;
                });
              },
            ),
            SizedBox(height: 16),
            // Input Mata Kuliah dan Nilai
            ListView.builder(
              itemCount: matakuliah.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Mata Kuliah: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedMatakuliah[index],
                      decoration: InputDecoration(labelText: 'Mata Kuliah'),
                      items: getAvailableMatakuliah(index).map((matkul) {
                        return DropdownMenuItem<String>(
                          value: matkul,
                          child: Text(matkul),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMatakuliah[index] = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: selectedNilai[index],
                      decoration: InputDecoration(labelText: 'Nilai'),
                      items: ['A', 'B+', 'B', 'C+', 'C', 'D', 'E'].map((nilai) {
                        return DropdownMenuItem<String>(
                          value: nilai,
                          child: Text(nilai),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedNilai[index] = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (selectedNilai.contains(null) ||
                      selectedMatakuliah.contains(null) ||
                      nama == null ||
                      npm == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Harap lengkapi semua data!"),
                    ));
                  } else {
                    var hasil = hitungIPKdanSks();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HasilIpkPage(
                          ipk: hasil['IPK']!,
                          totalSks: hasil['Total SKS']!,
                          selectedMatakuliah: selectedMatakuliah,
                          sksMatakuliah: sksMatakuliah,
                          selectedNilai: selectedNilai,
                          nama: nama!,
                          npm: npm!,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Hitung Nilai'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Color.fromARGB(255, 127, 197, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
