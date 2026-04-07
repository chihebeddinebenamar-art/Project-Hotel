import 'package:flutter/material.dart';
import '../../../const/constants.dart';
import '../../../models/room.dart';

/// Carte chambre pour la liste de résultats (image, note, favori, titre, prix).
class RoomCard extends StatelessWidget {
  const RoomCard({
    super.key,
    required this.room,
    required this.onTap,
    this.onToggleFavorite,
  });

  final Room room;
  final VoidCallback onTap;
  final VoidCallback? onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: AspectRatio(
                  aspectRatio: 16 / 11,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        room.imagePath,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Material(
                          color: Colors.white.withValues(alpha: 0.9),
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: onToggleFavorite,
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Icon(
                                room.isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: room.isFavorite ? Colors.red : Colors.black54,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.verified, color: AppColors.iosBlue, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    room.rating.toStringAsFixed(1).replaceAll('.', ','),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Text(
                    room.capacityLabel,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                room.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                '${room.pricePerNight}/night',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
