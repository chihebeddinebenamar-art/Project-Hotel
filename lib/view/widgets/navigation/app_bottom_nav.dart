import 'package:flutter/material.dart';
import '../../../const/constants.dart';

/// Barre de navigation inférieure (4 onglets) — style maquette « Home / My Room / Message / Profile ».
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      indicatorColor: AppColors.iosBlue.withValues(alpha: 0.12),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home, color: AppColors.iosBlue),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.bed_outlined),
          selectedIcon: Icon(Icons.bed, color: AppColors.iosBlue),
          label: 'My Room',
        ),
        NavigationDestination(
          icon: Icon(Icons.chat_bubble_outline),
          selectedIcon: Icon(Icons.chat_bubble, color: AppColors.iosBlue),
          label: 'Message',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person, color: AppColors.iosBlue),
          label: 'Profile',
        ),
      ],
    );
  }
}
