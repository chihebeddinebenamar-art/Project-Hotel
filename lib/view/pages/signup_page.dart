import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/constants.dart';
import '../widgets/buttons/gradient_primary_button.dart';
import 'main_shell.dart';

/// Création de compte — champs + dégradé + lien retour connexion + bloc admin statique.
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _mobile = TextEditingController();
  final _password = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _mobile.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget _underlineField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboard = TextInputType.text,
    bool obscure = false,
    Widget? prefix,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefix ?? Icon(icon, color: AppColors.iconBlue, size: 22),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Create account',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 28),
              _underlineField(
                controller: _name,
                hint: AppStrings.fullName,
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              _underlineField(
                controller: _email,
                hint: AppStrings.email,
                icon: Icons.person_outline,
                keyboard: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14, right: 4),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: '+216',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.green,
                        ),
                        items: const [
                          DropdownMenuItem(value: '+216', child: Text('+216')),
                        ],
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                  Container(width: 1, height: 28, color: Colors.grey.shade300),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _mobile,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: AppStrings.mobileNumber,
                        prefixIcon: Icon(
                          Icons.smartphone_outlined,
                          color: AppColors.iconBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _password,
                obscureText: _obscure,
                decoration: InputDecoration(
                  hintText: AppStrings.password,
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.iconBlue,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GradientPrimaryButton(
                label: AppStrings.createAccount,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute<void>(builder: (_) => const MainShell()),
                    (r) => false,
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAccount,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Text(
                      ' ${AppStrings.clickHere}',
                      style: TextStyle(
                        color: AppColors.coralLink,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
