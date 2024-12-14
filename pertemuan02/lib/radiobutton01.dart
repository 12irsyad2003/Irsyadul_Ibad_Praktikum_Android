import 'package:flutter/material.dart';

class Radiobutton01 extends StatefulWidget {
  const Radiobutton01({super.key});
  @override
  _RadioButton01State createState() => _RadioButton01State();
}

class _RadioButton01State extends State<Radiobutton01> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contoh RadioButton')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Pilih Hobi Anda : ', style: TextStyle(fontSize: 20)),
            RadioListTile<String>(
              title: Text('Bermain Musik'),
              value: 'Bermain Musik',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile(
              title: Text('Membaca'),
              value: 'Membaca',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile(
              title: Text('Olahraga'),
              value: 'Olahraga',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                _selectedOption != null
                    ? 'Hobbi yang dipilih : $_selectedOption'
                    : 'Silahklan Pilih Hobi.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
