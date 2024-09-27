import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade800, Colors.blue.shade400],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // App bar
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings, color: Colors.white),
                        onPressed: () {
                          print('Settings clicked');
                        },
                      ),
                    ],
                  ),
                ),
                // Profile information
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          // Profile picture
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.blue.shade800, width: 4),
                                ),
                              ),
                              const CircleAvatar(
                                radius: 55,
                                backgroundImage: NetworkImage(
                                  'https://example.com/profile_picture.jpg',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'CHasoul UIX',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Teknik Informatika A',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Action cards
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                _buildActionCard('Edit Profile', Icons.edit),
                                _buildActionCard('Change Password', Icons.lock),
                                _buildActionCard('My Grades', Icons.grade),
                                _buildActionCard(
                                    'Notifications', Icons.notifications),
                                _buildActionCard('Help & Support', Icons.help),
                                _buildActionCard('Logout', Icons.logout),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(String title, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.blue.shade800),
        ),
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blue.shade800),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          print('$title clicked');
        },
      ),
    );
  }
}
