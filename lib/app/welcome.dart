import 'package:flutter/material.dart';
import '../pages/home.dart'; // Import HomeScreen
import '../pages/info.dart'; // Import InfoScreen
import '../pages/profile.dart'; // Import ProfileScreen
import '../pages/news.dart'; // Import NewsScreen
import 'login.dart'; // Import LoginScreen

// ===================== CLASS WelcomeScreen ========================
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// =================== STATE dari WelcomeScreen =====================
class _WelcomeScreenState extends State<WelcomeScreen> {
  // Variabel untuk melacak indeks tab yang dipilih
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan berdasarkan tab yang dipilih
  final List<Widget> _pages = [
    const HomeScreen(), // Halaman HomeScreen
    const InfoScreen(), // Halaman InfoScreen
    const ProfileScreen(), // Halaman ProfileScreen
    const NewsScreen(), // Halaman NewsScreen
  ];

  // Fungsi untuk mengganti tab yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Mengubah indeks tab yang dipilih
    });
  }

  // Fungsi untuk melakukan logout dan kembali ke halaman login
  void _logout() {
    // Mengarahkan pengguna ke halaman LoginScreen dan mengganti halaman saat ini
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(), // Arahkan ke halaman LoginScreen
      ),
    );
  }

  // Fungsi untuk mengganti halaman dari drawer
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index; // Mengubah indeks tab yang dipilih
    });
    Navigator.of(context).pop(); // Menutup drawer setelah memilih
  }

  // ======================= BUILD METHOD =========================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ===================== APPBAR ===========================
      appBar: AppBar(
        title: const Text(
          'SMK Negeri 4 Mobile Apps', // Judul aplikasi
          style: TextStyle(
            color: Colors.white, // Warna teks putih
            fontWeight: FontWeight.bold, // Memberikan gaya tebal pada teks
            fontSize: 15, // Ukuran teks 15
          ),
        ),
        centerTitle: true, // Menempatkan judul di tengah AppBar
        backgroundColor: Colors.blueAccent, // Warna latar belakang AppBar biru
        elevation: 4, // Memberikan bayangan pada AppBar
        shadowColor: Colors.black
            .withOpacity(0.5), // Warna bayangan hitam setengah transparan
        actions: [
          IconButton(
            icon: const Icon(Icons.logout), // Ikon untuk logout
            onPressed: _logout,
          ),
        ],
      ),
      // ===================== BODY ===========================
      body: _pages[
          _selectedIndex], // Menampilkan halaman berdasarkan indeks tab yang dipilih
      // ============== DRAWER ===============================
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent, // Warna latar belakang header
              ),
              child: Text(
                'Menu', // Judul header drawer
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => _selectPage(0), // Pilih halaman Home
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Info'),
              onTap: () => _selectPage(1), // Pilih halaman Info
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () => _selectPage(2), // Pilih halaman Profile
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('News'),
              onTap: () => _selectPage(3), // Pilih halaman News
            ),
          ],
        ),
      ),
      // ============== BOTTOM NAVIGATION BAR =================
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // Daftar item navigasi bawah
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk tab Home
            label: 'Home', // Label untuk tab Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info), // Ikon untuk tab Info
            label: 'Info', // Label untuk tab Info
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ikon untuk tab Profile
            label: 'Profile', // Label untuk tab Profile
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article), // Ikon untuk tab News
            label: 'News', // Label untuk tab News
          ),
        ],
        currentIndex: _selectedIndex, // Menandakan tab yang saat ini dipilih
        selectedItemColor: Colors.blue, // Warna untuk item yang dipilih
        unselectedItemColor: Colors.grey, // Warna untuk item yang tidak dipilih
        onTap: _onItemTapped, // Fungsi yang dipanggil saat tab diklik
        showUnselectedLabels:
            true, // Menampilkan label pada item yang tidak dipilih
      ),
    );
  }
}
