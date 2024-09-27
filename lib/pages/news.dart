import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNewsCard(Icons.article, 'Berita Terbaru 1'),
          _buildNewsCard(Icons.trending_up, 'Berita Terbaru 2'),
          _buildNewsCard(Icons.notifications, 'Berita Terbaru 3'),
          _buildNewsCard(Icons.star, 'Berita Terbaru 4'),
        ],
      ),
    );
  }

  Widget _buildNewsCard(IconData icon, String title) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Icon(icon, size: 40.0),
        title: Text(title, style: const TextStyle(fontSize: 18.0)),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
