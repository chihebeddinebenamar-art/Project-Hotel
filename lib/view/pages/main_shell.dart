import 'package:flutter/material.dart';

import '../../const/constants.dart';
import '../data/notifiers.dart';
import '../widgets/navigation/app_bottom_nav.dart';
import 'home_search_page.dart';
import 'profile_page.dart';

/// Shell principal après authentification — onglets + navigation vers filtres / chatbot.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  @override
  void initState() {
    super.initState();
    mainTabIndexNotifier.addListener(_onTab);
  }

  void _onTab() => setState(() {});

  @override
  void dispose() {
    mainTabIndexNotifier.removeListener(_onTab);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final idx = mainTabIndexNotifier.value;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: IndexedStack(
        index: idx,
        children: const [
          HomeSearchPage(),
          _PlaceholderTab(title: 'My Room', message: 'Your bookings will appear here.'),
          _PlaceholderTab(title: 'Messages', message: 'No messages yet.'),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: idx,
        onTap: (i) => mainTabIndexNotifier.value = i,
      ),
    );
  }
}

/// Onglets secondaires — placeholders cohérents avec le reste de l’app.
class _PlaceholderTab extends StatelessWidget {
  const _PlaceholderTab({required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
