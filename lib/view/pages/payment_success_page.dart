import 'package:flutter/material.dart';

import '../../const/constants.dart';
import '../data/notifiers.dart';
import 'main_shell.dart';

/// Confirmation de paiement — retour possible vers le shell principal (onglet profil).
class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 96,
                        height: 96,
                        decoration: const BoxDecoration(
                          color: AppColors.successGreen,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check, color: Colors.white, size: 52),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        AppStrings.paymentSuccessTitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        AppStrings.paymentSuccessBody,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey.shade600, height: 1.4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            NavigationBar(
              selectedIndex: 3,
              indicatorColor: AppColors.iosBlue.withValues(alpha: 0.12),
              onDestinationSelected: (i) {
                mainTabIndexNotifier.value = i;
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(builder: (_) => const MainShell()),
                  (_) => false,
                );
              },
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.bed_outlined), label: 'My Room'),
                NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'Message'),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person, color: AppColors.iosBlue),
                  label: 'Profile',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
