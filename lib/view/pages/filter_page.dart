import 'package:flutter/material.dart';

import '../../const/constants.dart';

/// Filtres de recherche — slider budget + chips (données locales uniquement).
class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  RangeValues _budget = const RangeValues(34, 500);
  String _category = 'Room';
  final Set<String> _stars = {};
  String _rating = '8 points or more';
  String _bed = '1 double bed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.chevron_left, color: AppColors.filterBlue),
          label: const Text(AppStrings.back, style: TextStyle(color: AppColors.filterBlue)),
        ),
        leadingWidth: 100,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const Text('Budget per night', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0 €', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                    Text('1000+ €', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                  ],
                ),
                RangeSlider(
                  values: _budget,
                  min: 0,
                  max: 1000,
                  divisions: 100,
                  activeColor: AppColors.filterBlue,
                  inactiveColor: Colors.grey.shade300,
                  onChanged: (v) => setState(() => _budget = v),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _BubbleLabel(text: '${_budget.start.round()} €'),
                    _BubbleLabel(text: '${_budget.end.round()} €'),
                  ],
                ),
                const SizedBox(height: 24),
                const Text('Category', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _CategoryChip(
                      label: 'Room',
                      selected: _category == 'Room',
                      onTap: () => setState(() => _category = 'Room'),
                    ),
                    _CategoryChip(
                      label: 'Rooms and suites',
                      selected: _category == 'Rooms and suites',
                      onTap: () => setState(() => _category = 'Rooms and suites'),
                    ),
                    _CategoryChip(
                      label: 'Apartments',
                      selected: _category == 'Apartments',
                      onTap: () => setState(() => _category = 'Apartments'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text('Stars', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final s in ['1 star', '2 stars', '3 stars', '4 stars', '5 stars'])
                      _FilterChip(
                        label: s,
                        selected: _stars.contains(s),
                        onTap: () {
                          setState(() {
                            if (_stars.contains(s)) {
                              _stars.remove(s);
                            } else {
                              _stars.add(s);
                            }
                          });
                        },
                      ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text('Puntuación', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final r in [
                      '5 points or more',
                      '6 points or more',
                      '7 points or more',
                      '8 points or more',
                      '9 points or more',
                    ])
                      _RatingChip(
                        label: r,
                        selected: _rating == r,
                        onTap: () => setState(() => _rating = r),
                      ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text('Preferencia de cama', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    _FilterChip(
                      label: '2 single beds',
                      selected: _bed == '2 single beds',
                      onTap: () => setState(() => _bed = '2 single beds'),
                    ),
                    _FilterChip(
                      label: '1 double bed',
                      selected: _bed == '1 double bed',
                      onTap: () => setState(() => _bed = '1 double bed'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.filterBlue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(AppStrings.seeResults, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BubbleLabel extends StatelessWidget {
  const _BubbleLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.filterBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      backgroundColor: AppColors.chipGrey,
      selectedColor: AppColors.iosBlue.withValues(alpha: 0.12),
      labelStyle: TextStyle(
        color: selected ? AppColors.filterBlue : Colors.black87,
        fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: selected ? AppColors.filterBlue : Colors.transparent),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label, style: const TextStyle(fontSize: 13)),
      selected: selected,
      onSelected: (_) => onTap(),
      backgroundColor: AppColors.chipGrey,
      selectedColor: AppColors.iosBlue.withValues(alpha: 0.12),
      checkmarkColor: AppColors.filterBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: selected ? AppColors.filterBlue : Colors.transparent),
      ),
    );
  }
}

class _RatingChip extends StatelessWidget {
  const _RatingChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label, style: const TextStyle(fontSize: 13)),
      selected: selected,
      onSelected: (_) => onTap(),
      showCheckmark: false,
      backgroundColor: AppColors.chipGrey,
      selectedColor: AppColors.iosBlue.withValues(alpha: 0.12),
      checkmarkColor: AppColors.filterBlue,
      labelStyle: TextStyle(
        color: selected ? AppColors.filterBlue : Colors.black87,
        fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: selected ? AppColors.filterBlue : Colors.transparent),
      ),
    );
  }
}
