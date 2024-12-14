import 'package:flutter/material.dart';
import 'mtk02.dart'; // Ensure this file exists and has the required constructor to accept 'hasil'

class Mtk01 extends StatefulWidget {
  const Mtk01({Key? key}) : super(key: key);

  @override
  Mtk01State createState() => Mtk01State();
}

class Mtk01State extends State<Mtk01> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String operation = '';

  void rumusPerhitunganMTK() {
    // Parse the numbers from text fields
    double num1 = double.tryParse(num1Controller.text) ?? 0.0;
    double num2 = double.tryParse(num2Controller.text) ?? 0.0;
    double result = 0.0;

    // Perform operation based on the selected operator
    switch (operation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = (num2 != 0)
            ? num1 / num2
            : double.infinity; // Prevent division by zero
        break;
      default:
        return;
    }

    // Navigate to Mtk02 screen and pass the result
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Mtk02(hasil: result),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pemilihan Perhitungan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Angka 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Angka 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      operation = '+';
                      rumusPerhitunganMTK();
                    });
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      operation = '-';
                      rumusPerhitunganMTK();
                    });
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      operation = '*';
                      rumusPerhitunganMTK();
                    });
                  },
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      operation = '/';
                      rumusPerhitunganMTK();
                    });
                  },
                  child: const Text('/'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
