import 'package:flutter/material.dart';

import 'const/constants.dart';
import 'view/pages/introduction_page.dart';

/// Point d’entrée — thème global et page d’introduction (logo → accueil après 5 s).
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HotelApp());
}

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const IntroductionPage(),
    );
  }
}
