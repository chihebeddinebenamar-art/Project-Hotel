import 'package:flutter/material.dart';

import '../../const/constants.dart';

/// Profil utilisateur — avatar, menu, déconnexion (aucune persistance).
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: [
          const SizedBox(height: 8),
          const Text(
            'Profile',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage(AppAssets.image1),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.profileUserName,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      AppStrings.profileHandle,
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
            ],
          ),
          const SizedBox(height: 28),
          Text(
            AppStrings.setting,
            style: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          _MenuTile(icon: Icons.credit_card, label: AppStrings.yourCard),
          _MenuTile(icon: Icons.shield_outlined, label: AppStrings.security),
          _MenuTile(icon: Icons.calendar_today_outlined, label: AppStrings.reservations),
          _MenuTile(icon: Icons.language, label: AppStrings.languages),
          _MenuTile(icon: Icons.help_outline, label: AppStrings.helpSupport),
          const SizedBox(height: 16),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                AppStrings.logout,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon, color: Colors.black87),
          title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          trailing: const Icon(Icons.chevron_right, size: 20),
          onTap: () {},
        ),
        Divider(height: 1, color: Colors.grey.shade300),
      ],
    );
  }
}
