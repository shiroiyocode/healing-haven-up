import 'package:flutter/material.dart';
import 'package:healing_haven/doctorUI/privacypolicy.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            _buildSettingsTile(
              icon: Icons.edit,
              title: "Edit Profile",
              onTap: () {
                // Handle edit profile tap
                Navigator.pushNamed(context, '/editportfolio');
              },
            ),
            Divider(thickness: 1, color: Colors.white),

            _buildSettingsTile(
              icon: Icons.lock,
              title: "Change Password",
              onTap: () {
                // Handle change password tap
                Navigator.pushNamed(context, '/changepassword');
              },
            ),
            Divider(thickness: 1, color: Colors.white),

            _buildSettingsTile(
              icon: Icons.privacy_tip,
              title: "Privacy Policy",
              onTap: () {
                // Handle privacy policy tap
                launchPrivacyPolicy();
              },
            ),
            Divider(thickness: 1, color: Colors.white),
          ],
        ),
        _buildSettingsTile(
          icon: Icons.logout,
          title: "Log Out",
          onTap: () {
            // Handle logout tap
            Navigator.pushReplacementNamed(context, '/loginpage');
          },
        ),
      ],
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.brown),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
