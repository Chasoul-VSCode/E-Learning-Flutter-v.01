import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;
  final List<String> _images = [
    'https://pusdatin.kemdikbud.go.id/wp-content/uploads/2020/03/banner-rumbel-belajar-di-rumah-1.jpg',
    'https://www.infosatu.co/wp-content/uploads/2020/04/a86b7d14748a1e0618fe64598e8ce7f4.jpg',
    'https://bbppmpvbispar.kemdikbud.go.id/portal/wp-content/uploads/2020/03/belajar-daring-800x445.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 10000), (timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardItems = [
      {'icon': Icons.book, 'color': const Color(0xFF4A90E2), 'label': 'Perpustakaan'},
      {'icon': Icons.school, 'color': const Color(0xFFE57373), 'label': 'Kelas'},
      {'icon': Icons.assignment, 'color': const Color(0xFFFFB74D), 'label': 'Tugas'},
      {'icon': Icons.schedule, 'color': const Color(0xFF81C784), 'label': 'Jadwal'},
      {'icon': Icons.grade, 'color': const Color(0xFF9575CD), 'label': 'Nilai'},
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Selamat Datang!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = _pageController.page! - index;
                        value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                      }
                      return Center(
                        child: SizedBox(
                          height: Curves.easeInOut.transform(value) * 200,
                          width: Curves.easeInOut.transform(value) * 350,
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(_images[index]),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Menu Utama',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Lihat Semua',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: cardItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        print('${cardItems[index]['label']} clicked');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: cardItems[index]['color'].withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              cardItems[index]['icon'],
                              color: cardItems[index]['color'],
                              size: 32,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            cardItems[index]['label'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}