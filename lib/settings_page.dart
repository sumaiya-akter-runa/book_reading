import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final bool isLoggedIn;

  const SettingsPage({super.key, this.isLoggedIn = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            if (!isLoggedIn) ...[
              const Text(
                "You're browsing as a guest.",
                style: TextStyle(color: Color(0xFF6E6E6E)),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {
                  // Navigate to sign in / sign up page
                },
                icon: const Icon(Icons.login),
                label: const Text("Sign In or Create Account"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5D5FEF),
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
            ],

            if (isLoggedIn) ...[
              _section("Account Settings"),
              _tile(Icons.person, "Profile Info"),
              _tile(Icons.verified_user, "Subscription Status"),
            ],

            _section("Reading Preferences"),
            _tile(Icons.text_fields, "Font Size & Style"),
            _tile(Icons.brightness_6, "Theme (Light/Dark)"),
            _tile(Icons.view_agenda, "Scroll / Page Mode"),

            _section("Notifications"),
            _tile(Icons.notifications, "Book Alerts & Reminders"),

            _section("Language & Download"),
            _tile(Icons.language, "App Language"),
            _tile(Icons.download, "Download Settings"),

            _section("Help & About"),
            _tile(Icons.help_outline, "FAQs & Support"),
            _tile(Icons.privacy_tip, "Privacy Policy"),
            _tile(Icons.info_outline, "About Readora"),

            const SizedBox(height: 20),
            if (isLoggedIn)
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B6B),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // Handle logout
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _section(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2E2E2E)),
      ),
    );
  }

  Widget _tile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF5D5FEF)),
      title: Text(title, style: const TextStyle(color: Color(0xFF2E2E2E))),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
