import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0XFF800000)),
          onPressed: () {
            Navigator.pop(context);
            // Tambahkan fungsi back di sini
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Foto Profil, Nama, dan Email
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('assets/profile.jpeg'),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.add, color: Color(0XFF800000)),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Azmi Wafiqi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'azmiwafiqi2@gmail.com',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // Statistik
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStatCard("5", "Interesting", const Color(0XFF800000)),
                  _buildStatCard("20", "Saved", const Color(0XFF800000)),
                  _buildStatCard("12", "Following", const Color(0XFF800000)),
                ],
              ),
              const SizedBox(height: 24),

              // Pengaturan
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              _buildSettingOption(Icons.notifications, 'Notifications Center'),
              _buildSettingOption(Icons.lock, 'Change Password'),
              _buildSettingOption(Icons.language, 'Language'),
              _buildSettingOption(Icons.help_outline, 'FAQs'),

              const SizedBox(height: 24),

              // Tombol Logout
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Tambahkan fungsi logout di sini
                  },
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text(
                    'Log Out',
                    style: TextStyle(color: Colors.red),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0XFF800000)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0XFF800000),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildStatCard(String count, String label, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingOption(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0XFF800000)),
      title: Text(title),
      trailing:
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: () {
        // Tambahkan fungsi onTap untuk setiap opsi pengaturan
      },
    );
  }
}
