import 'package:flutter/material.dart';
import 'app/login.dart'; // Import your LoginScreen here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengembalikan MaterialApp sebagai struktur aplikasi
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Menentukan judul aplikasi
      title: 'SMK Negeri 4 App',
      // Mengatur tema aplikasi dengan warna dasar biru
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Menentukan halaman utama aplikasi (LoginScreen)
      home: const LoginScreen(), // Ensure LoginScreen is a valid widget
    );
  }
}
