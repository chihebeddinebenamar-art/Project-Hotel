import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/constants.dart';
import '../widgets/buttons/gradient_primary_button.dart';
import '../widgets/layout/diamond_collage.dart';
import 'login_page.dart';

/// Accueil marketing (« page d’accueil ») — mosaïque + accroche + passage au login.
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.diamond_outlined, color: AppColors.lavender, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'SmartHotel+',
                    style: TextStyle(
                      color: AppColors.lavender,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              DiamondCollage(assetPaths: AppAssets.collageImages),
              const SizedBox(height: 32),
              Text(
                AppStrings.onboardingHeadline,
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                AppStrings.onboardingSubtitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14, height: 1.4),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: GradientPrimaryButton(
                  label: AppStrings.letsGo,
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryBlue, Color(0xFF5B8CFF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(builder: (_) => const LoginPage()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
