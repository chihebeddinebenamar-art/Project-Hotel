import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Couleurs alignées sur les maquettes Figma (SmartHotel+, réservation, paiement).
class AppColors {
  AppColors._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color navy = Color(0xFF2E4A62);
  static const Color gold = Color(0xFFC5A059);
  static const Color primaryBlue = Color(0xFF306BFF);
  static const Color iosBlue = Color(0xFF007AFF);
  static const Color filterBlue = Color(0xFF007BFF);
  static const Color chatBlue = Color(0xFF2D54AF);
  static const Color iconBlue = Color(0xFF4A90E2);
  static const Color gradientBlueStart = Color(0xFF0080FF);
  static const Color gradientMintEnd = Color(0xFF00FFC0);
  static const Color gradientBlueAlt = Color(0xFF008BFF);
  static const Color gradientTealEnd = Color(0xFF00E3A3);
  static const Color adminNavy = Color(0xFF002147);
  static const Color coralLink = Color(0xFFE85D5D);
  static const Color termsGreen = Color(0xFF2ECC71);
  static const Color lavender = Color(0xFF9D7BFF);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color chipGrey = Color(0xFFE5E7EB);
  static const Color cardGrey = Color(0xFFEFEFEF);
  static const Color botBubble = Color(0xFFF2F2F2);
  static const Color inputFill = Color(0xFFF5F5F5);
  static const Color successGreen = Color(0xFF4CD964);

  /// Bouton principal type inscription / CTA bleu plein.
  static const LinearGradient signupGradient = LinearGradient(
    colors: [gradientBlueStart, gradientMintEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// Variante légèrement différente pour certains écrans.
  static const LinearGradient signupGradientAlt = LinearGradient(
    colors: [gradientBlueAlt, gradientTealEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

/// Chemins centralisés vers les fichiers [AssetImage] (dossier `images/` à la racine du projet).
///
/// Fichiers : `logo.png`, `image1.png` … `image5.png`.
class AppAssets {
  AppAssets._();

  static const String logo = 'images/logo.png';
  static const String image1 = 'images/image1.png';
  static const String image2 = 'images/image2.png';
  static const String image3 = 'images/image3.png';
  static const String image4 = 'images/image4.png';
  static const String image5 = 'images/image5.png';

  /// Mosaïque d’onboarding (5 visuels).
  static const List<String> collageImages = [
    image1,
    image2,
    image3,
    image4,
    image5,
  ];
}

/// Chaînes réutilisées dans l’UI (évite les fautes de frappe et facilite i18n future).
class AppStrings {
  AppStrings._();

  static const String appName = 'SmartHotel+';
  static const String splashTitle = 'SmartHotel';
  static const String onboardingHeadline = "Let's Find Your Sweet & Dream Room";
  static const String onboardingSubtitle =
      'Get the opportunity to stay in a beautiful room with affordable price.';
  static const String letsGo = "Let's Go";
  static const String login = 'Sign in';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String fullName = 'Full Name';
  static const String mobileNumber = 'Mobile Number';
  static const String createAccount = 'Create Account';
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String clickHere = 'Click Here';

  static const String adminSignIn = 'SIGN IN';
  static const String termsPrefix =
      'By creating an account, you are agree to our ';
  static const String terms = 'Terms';
  static const String searchSummary =
      'Sousse | Apr 2 – Apr 9 | 1 Adult, 1 Child';
  static const String back = 'Back';
  static const String sort = 'Sort';
  static const String filter = 'Filter';
  static const String chatbot = 'Chatbot';
  static const String seeResults = 'See results';
  static const String selectRoom = 'Select Room';
  static const String completePayment = 'Complete payment';
  static const String paymentSuccessTitle = 'Payment successfully confirmed!';
  static const String paymentSuccessBody =
      "You will receive a confirmation email in your inbox. Make sure it's not in your spam folder.";
  static const String profileUserName = 'Hadir Ben Ameur';
  static const String profileHandle = '@Broklyn';
  static const String setting = 'Setting';
  static const String yourCard = 'Your Card';
  static const String security = 'Security';
  static const String reservations = 'Reservations';
  static const String languages = 'Languages';
  static const String helpSupport = 'Help and Support';
  static const String logout = 'Logout';
}

/// Routes nommées pour une navigation prévisible et testable.
class AppRoutes {
  AppRoutes._();

  /// Première route : logo puis redirection vers l’accueil (voir [IntroductionPage]).
  static const String introduction = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String hotelDetail = '/hotel-detail';
  static const String filter = '/filter';
  static const String payment = '/payment';
  static const String paymentSuccess = '/payment-success';
  static const String chatbot = '/chatbot';
}

/// Thème global Material 3 + polices Google (Playfair pour titres serif, Inter pour le corps).
class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final base = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryBlue,
        brightness: Brightness.light,
        primary: AppColors.primaryBlue,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.white,
    );
    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).copyWith(
        headlineMedium: GoogleFonts.playfairDisplay(
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        titleLarge: GoogleFonts.playfairDisplay(
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(color: AppColors.textPrimary),
        bodyMedium: GoogleFonts.inter(color: AppColors.textSecondary),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: AppColors.textPrimary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        hintStyle: GoogleFonts.inter(color: AppColors.textMuted),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryBlue, width: 1.5),
        ),
      ),
    );
  }
}
