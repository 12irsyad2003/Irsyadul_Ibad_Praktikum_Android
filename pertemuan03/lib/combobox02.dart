import 'package:flutter/material.dart';

class Combobox02 extends StatefulWidget {
  const Combobox02({super.key});

  @override
  _Combobox02State createState() => _Combobox02State();
}

class _Combobox02State extends State<Combobox02> {
  String? pilihKategor;
  String? pilihItem;

  final List<String> categories = ["Buah", "Sayur"];

  final Map<String, List<String>> items = {
    'Buah': ['Apel', 'Pisang', 'Jeruk'],
    'Sayur': ['Wortel', 'Bayam', 'Kangkung']
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combo Bersarang'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: pilihKategor,
              hint: const Text('Pilih Kategori'),
              onChanged: (String? newValue) {
                setState(() {
                  pilihKategor = newValue;
                  pilihItem = null; // Reset selected item when category changes
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: pilihItem,
              hint: const Text('Pilih Item'),
              onChanged: (String? newValue) {
                setState(() {
                  pilihItem = newValue;
                });
              },
              items: pilihKategor != null
                  ? items[pilihKategor!]!
                      .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()
                  : [], // Display items based on selected category
            ),
          ],
        ),
      ),
    );
  }
}
