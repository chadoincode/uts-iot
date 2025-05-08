import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'patient.dart';
import 'nurse.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoring Pasien',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Monitoring Pasien")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Masuk sebagai Pasien 01'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => HalamanPasien(idPasien: 'pasien01'),
                ));
              },
            ),
            ElevatedButton(
              child: Text('Masuk sebagai Pasien 02'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => HalamanPasien(idPasien: 'pasien02'),
                ));
              },
            ),
            ElevatedButton(
              child: Text('Masuk sebagai Perawat'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => HalamanPerawat(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
