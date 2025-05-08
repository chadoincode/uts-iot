import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class HalamanPerawat extends StatefulWidget {
  @override
  _HalamanPerawatState createState() => _HalamanPerawatState();
}

class _HalamanPerawatState extends State<HalamanPerawat> {
  final DatabaseReference _ref = FirebaseDatabase.instance.ref('pasien');
  Map<String, dynamic> dataPasien = {};

  @override
  void initState() {
    super.initState();
    _ref.onValue.listen((event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          dataPasien = Map<String, dynamic>.from(data);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PERAWAT')),
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: dataPasien.entries.map((entry) {
          final status = entry.value['status'];
          final pesan = entry.value['pesan'];

          return Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text('${entry.key.toUpperCase()}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Status: $status'),
                  Text('Pesan: $pesan'),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
