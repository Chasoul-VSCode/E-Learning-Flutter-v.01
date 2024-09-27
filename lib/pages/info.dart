import 'package:flutter/material.dart';

// Membuat sebuah kelas bernama InfoScreen yang merupakan turunan dari StatelessWidget
class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Memberikan padding di sekitar konten
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Menyelaraskan konten ke kiri
          children: [
            const Text(
              'Informasi Penting',
              style: TextStyle(
                fontSize: 24, // Ukuran teks
                fontWeight: FontWeight.bold, // Gaya teks tebal
              ),
            ),
            const SizedBox(height: 20), // Ruang antara judul dan daftar
            Expanded(
              child: ListView(
                children: [
                  _buildInfoCard('Kegiatan Sekolah', Icons.school,
                      'Kegiatan ekstrakurikuler dan informasi lainnya.'),
                  _buildInfoCard('Pengumuman', Icons.announcement,
                      'Pengumuman terbaru terkait sekolah.'),
                  _buildInfoCard('Kontak Penting', Icons.contact_phone,
                      'Nomor kontak guru dan staff sekolah.'),
                  _buildInfoCard('Jadwal Ujian', Icons.calendar_today,
                      'Informasi mengenai jadwal ujian.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun kartu informasi
  Widget _buildInfoCard(String title, IconData icon, String description) {
    return Card(
      elevation: 2, // Memberikan bayangan pada kartu
      margin: const EdgeInsets.symmetric(vertical: 8), // Ruang antara kartu
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent), // Ikon di sebelah kiri
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold)), // Judul kartu
        subtitle: Text(description), // Deskripsi kartu
        onTap: () {
          // Tindakan saat kartu diklik (bisa diisi dengan fungsi untuk membuka detail lebih lanjut)
          print('$title clicked'); // Cetak di konsol
        },
      ),
    );
  }
}
