import '../const/constants.dart';
import '../models/room.dart';

/// Catalogue statique — remplaçable plus tard par une API.
class RoomCatalog {
  RoomCatalog._();

  static final List<Room> rooms = [
    Room(
      id: '1',
      title: 'Room 1',
      imagePath: AppAssets.image1,
      pricePerNight: '67 €',
      rating: 8.3,
      capacityLabel: '1 room 2 people',
      description:
          'This room features a terrace with a small rooftop pool, offering a pleasant view. '
          'It is elegantly decorated, soundproofed, and designed for a comfortable stay.',
      reviewCount: 140,
      isFavorite: true,
    ),
    Room(
      id: '2',
      title: 'Room 2',
      imagePath: AppAssets.image2,
      pricePerNight: '72 €',
      rating: 8.7,
      capacityLabel: '1 room 2 people',
      description:
          'Spacious layout with modern amenities, city view, and premium bedding for restful nights.',
      reviewCount: 98,
    ),
    Room(
      id: '3',
      title: 'King Room',
      imagePath: AppAssets.image3,
      pricePerNight: r'$20',
      rating: 4.7,
      capacityLabel: '1 room 2 people',
      description:
          'King-size comfort with refined finishes — ideal for extended stays.',
      reviewCount: 56,
    ),
  ];

  static Room? byId(String id) {
    try {
      return rooms.firstWhere((r) => r.id == id);
    } catch (_) {
      return rooms.isEmpty ? null : rooms.first;
    }
  }
}
