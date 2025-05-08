import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HalamanPasien extends StatelessWidget {
  final String idPasien;

  HalamanPasien({super.key, required this.idPasien});

  final DatabaseReference _ref = FirebaseDatabase.instance.ref('pasien');

  void kirimPermintaan() {
    _ref.child(idPasien).set({
      'status': 1,
      'pesan': '$idPasien meminta bantuan',
    });
  }

  void hapusPermintaan() {
    _ref.child(idPasien).set({
      'status': 0,
      'pesan': '',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(idPasien)),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tekan tombol jika butuh bantuan', style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: kirimPermintaan,
              child: Text('MINTA BANTUAN'),
            ),
            ElevatedButton(
              onPressed: hapusPermintaan,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: Text('BATALKAN'),
            )
          ],
        ),
      ),
    );
  }
}
