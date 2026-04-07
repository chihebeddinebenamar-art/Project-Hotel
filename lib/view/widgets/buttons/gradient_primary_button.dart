import 'package:flutter/material.dart';
import '../../../const/constants.dart';

/// Bouton pill avec dégradé bleu → menthe (écrans inscription / CTA).
class GradientPrimaryButton extends StatelessWidget {
  const GradientPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.gradient = AppColors.signupGradient,
  });

  final String label;
  final VoidCallback onPressed;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(28),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          height: 52,
          decoration: BoxDecoration(gradient: gradient),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
