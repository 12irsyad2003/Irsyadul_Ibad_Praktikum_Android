import 'package:flutter/material.dart';

class Studikasus01 extends StatefulWidget {
  const Studikasus01({super.key});

  @override
  _Studikasus01State createState() => _Studikasus01State();
}

class _Studikasus01State extends State<Studikasus01> {
  final TextEditingController _nilaiController1 = TextEditingController();
  final TextEditingController _nilaiController2 = TextEditingController();

  bool _tambahChecked = false;
  bool _kurangChecked = false;

  String _result = '';

  void _hitung() {
    double? nilai1 = double.tryParse(_nilaiController1.text);
    double? nilai2 = double.tryParse(_nilaiController2.text);

    if (nilai1 != null && nilai2 != null) {
      setState(() {
        _result = '';

        if (_tambahChecked) {
          _result += 'Hasil Penjumlahan : ${nilai1 + nilai2}\n';
        }
        if (_kurangChecked) {
          _result += 'Hasil Pengurangan : ${nilai1 - nilai2}\n';
        }
        if (!_tambahChecked && !_kurangChecked) {
          _result = 'Silahkan Pilih Operasi.';
        }
      });
    } else {
      setState(() {
        _result = 'Input Tidak Valid. Mohon Masukkan Angka.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Operasi Matematika')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nilaiController1,
              decoration: InputDecoration(labelText: 'Masukkan Angka Pertama'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _nilaiController2,
              decoration: InputDecoration(labelText: 'Masukkan Angka Kedua'),
              keyboardType: TextInputType.number,
            ),
            CheckboxListTile(
              title: Text('Hitung Penjumlahan'),
              value: _tambahChecked,
              onChanged: (bool? value) {
                setState(() {
                  _tambahChecked = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Hitung Pengurangan'),
              value: _kurangChecked,
              onChanged: (bool? value) {
                setState(() {
                  _kurangChecked = value ?? false;
                });
              },
            ),
            ElevatedButton(
              onPressed: _hitung,
              child: Text('Hitung'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                _result,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}