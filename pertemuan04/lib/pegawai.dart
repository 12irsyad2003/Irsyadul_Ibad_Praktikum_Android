import 'package:flutter/material.dart';
import 'gaji.dart'; // Ensure Gaji class is defined and imported
import 'slipgaji.dart'; // Ensure Slipgaji widget is defined and imported

class Pegawai extends StatefulWidget {
  const Pegawai({super.key});
  @override
  State<Pegawai> createState() => _PegawaiState();
}

class _PegawaiState extends State<Pegawai> {
  String _nip = '';
  String _nama = '';
  String? _pilihanGolongan;
  String? _pilihanStatus;

  final TextEditingController nipController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController masaController = TextEditingController();
  var salary = Gaji();

  final List<String> golongan = ['I', 'II', 'III', 'IV'];
  final List<String> status = ['Menikah', 'Belum Menikah'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gaji Pegawai'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // NIP TextField
            TextField(
              controller: nipController,
              decoration: const InputDecoration(labelText: 'NIP Pegawai'),
              onChanged: (value) {
                setState(() {
                  _nip = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Nama TextField
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: 'Nama Pegawai'),
              onChanged: (value) {
                setState(() {
                  _nama = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Golongan Dropdown
            DropdownButton<String>(
              hint: const Text('Golongan Pegawai'),
              value: _pilihanGolongan,
              onChanged: (String? value) {
                setState(() {
                  _pilihanGolongan = value;
                  salary.setGolongan(value);
                });
              },
              items: golongan.map<DropdownMenuItem<String>>((String gol) {
                return DropdownMenuItem<String>(
                  value: gol,
                  child: Text(gol),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Status Dropdown
            DropdownButton<String>(
              hint: const Text('Status Pegawai'),
              value: _pilihanStatus,
              onChanged: (String? value) {
                setState(() {
                  _pilihanStatus = value;
                  salary.setStatus(value);
                });
              },
              items: status.map<DropdownMenuItem<String>>((String sts) {
                return DropdownMenuItem<String>(
                  value: sts,
                  child: Text(sts),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Masa Kerja TextField
            TextField(
              controller: masaController,
              decoration: const InputDecoration(
                  labelText: 'Jumlah Masa Kerja dalam tahun'),
              onChanged: (value) {
                setState(() {
                  // Convert value to int, handle possible format error
                  salary.setMasaKerja(int.tryParse(value) ?? 0);
                });
              },
            ),
            const SizedBox(height: 16),
            // Hitung Gaji Button
            ElevatedButton(
              onPressed: () {
                if (_nip.isEmpty ||
                    _nama.isEmpty ||
                    _pilihanGolongan == null ||
                    _pilihanStatus == null) {
                  // Show an error dialog if required fields are missing
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text('Mohon lengkapi semua data.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Navigate to Slipgaji
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Slipgaji(
                        nip: _nip,
                        nama: _nama,
                        tunjGol: salary.tunjGapok(),
                        tunjStatus: salary.tunjStatus(),
                        tunjMasaKerja: salary.tunjMasaKerja(),
                        gajiTotal: salary.gajiTotal(),
                      ),
                    ),
                  );
                }
              },
              child: const Text('Hitung Gaji'),
            ),
          ],
        ),
      ),
    );
  }
}
