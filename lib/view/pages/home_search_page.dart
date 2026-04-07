import 'package:flutter/material.dart';

import '../../const/constants.dart';
import '../../models/room.dart';
import '../../services/room_catalog.dart';
import '../widgets/cards/room_card.dart';
import 'chatbot_page.dart';
import 'filter_page.dart';
import 'hotel_detail_page.dart';

/// Liste de chambres (écran « Home ») — barre de résumé, actions, cartes cliquables.
class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({super.key});

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  late List<Room> _rooms;

  @override
  void initState() {
    super.initState();
    _rooms = List<Room>.from(RoomCatalog.rooms);
  }

  void _toggleFavorite(int index) {
    setState(() {
      final r = _rooms[index];
      _rooms[index] = Room(
        id: r.id,
        title: r.title,
        imagePath: r.imagePath,
        pricePerNight: r.pricePerNight,
        rating: r.rating,
        capacityLabel: r.capacityLabel,
        description: r.description,
        reviewCount: r.reviewCount,
        isFavorite: !r.isFavorite,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Search',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                AppStrings.searchSummary,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _PillButton(
                  icon: Icons.swap_vert,
                  label: AppStrings.sort,
                  onTap: () {},
                ),
                _PillButton(
                  icon: Icons.filter_list,
                  label: AppStrings.filter,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (_) => const FilterPage()),
                    );
                  },
                ),
                _PillButton(
                  icon: Icons.smart_toy_outlined,
                  label: AppStrings.chatbot,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (_) => const ChatbotPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _rooms.length,
              itemBuilder: (context, i) {
                final room = _rooms[i];
                return RoomCard(
                  room: room,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => HotelDetailPage(room: room),
                      ),
                    );
                  },
                  onToggleFavorite: () => _toggleFavorite(i),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PillButton extends StatelessWidget {
  const _PillButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Material(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 18, color: Colors.grey.shade800),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
