import 'package:flutter/material.dart';

class ContohStatefullWidget extends StatefulWidget {
  @override
  _ContohStatefullWidgetState createState() => _ContohStatefullWidgetState();
}

class _ContohStatefullWidgetState extends State<ContohStatefullWidget> {
  final TextEditingController _controller = TextEditingController();
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateful Input')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Masukkan Nama'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            Text(
              'Nama: $_name',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}