import 'package:flutter/material.dart';

import '../../const/constants.dart';
import '../../models/room.dart';
import 'payment_success_page.dart';

/// Saisie carte bancaire statique — aucune donnée n’est transmise hors de l’app.
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, this.room});

  final Room? room;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _cardExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.chevron_left, color: AppColors.filterBlue),
                label: const Text(AppStrings.back, style: TextStyle(color: AppColors.filterBlue)),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _MethodRow(
                    icon: Icons.credit_card,
                    title: 'Card payment',
                    subtitle: 'Pay with your credit or debit card',
                    expanded: _cardExpanded,
                    onTap: () => setState(() => _cardExpanded = !_cardExpanded),
                  ),
                  if (_cardExpanded) ...[
                    const SizedBox(height: 16),
                    _LabeledField(
                      label: 'Card number',
                      child: TextFormField(
                        initialValue: '7498 4809 9473 2947',
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.credit_card, color: Colors.orange),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Expiration date'),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      initialValue: '03',
                                      decoration: const InputDecoration(border: OutlineInputBorder()),
                                      items: const [
                                        DropdownMenuItem(value: '03', child: Text('03')),
                                      ],
                                      onChanged: (_) {},
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      initialValue: '24',
                                      decoration: const InputDecoration(border: OutlineInputBorder()),
                                      items: const [
                                        DropdownMenuItem(value: '24', child: Text('24')),
                                      ],
                                      onChanged: (_) {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('CVV/CVC'),
                              const SizedBox(height: 6),
                              TextFormField(
                                initialValue: '493',
                                decoration: const InputDecoration(border: OutlineInputBorder()),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _LabeledField(
                      label: 'Cardholder',
                      child: TextFormField(
                        initialValue: 'HADIR BEN AMEUR',
                        decoration: const InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  _MethodRow(
                    icon: Icons.face,
                    title: 'Face ID',
                    subtitle: 'Confirm your payment with Face ID',
                    expanded: false,
                    trailingChevronRight: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.filterBlue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const PaymentSuccessPage(),
                    ),
                  );
                },
                child: const Text(
                  AppStrings.completePayment,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MethodRow extends StatelessWidget {
  const _MethodRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.expanded,
    required this.onTap,
    this.trailingChevronRight = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool expanded;
  final VoidCallback onTap;
  final bool trailingChevronRight;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: expanded ? AppColors.iosBlue.withValues(alpha: 0.06) : AppColors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey.shade700),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                    Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                  ],
                ),
              ),
              Icon(
                trailingChevronRight ? Icons.chevron_right : Icons.keyboard_arrow_down,
                color: AppColors.filterBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade700, fontSize: 13)),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}
